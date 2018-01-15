<?php

namespace AppBundle\Controller;

use AppBundle\Form\Type\ItemType;
use AppBundle\Form\Type\CommentType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\Item;
use AppBundle\Entity\Comment;
use FOS\UserBundle\Model\User;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Session\Session;


class ItemController extends Controller
{
    /**
     * @Route("/article", name="article")
     */
    public function addAction(Request $request)
    {
        $session = new Session();
        $item = new Item();
        $form = $this->createForm(ItemType::class, $item);

        $form->handleRequest($request);

        if ($form->isValid()) {
            $item = $form->getData();
            $em = $this->getDoctrine()->getManager();
            $em->persist($item);
            $em->flush();

            $session->getFlashBag()->add('infos', 'Ajout effectué');

            return $this->redirectToRoute('list');
        }
        // replace this example code with whatever you need
        return $this->render('item/add.html.twig', ['form' => $form->createView()]);
    }

    /**
     * @Route("/list", name="list")
     */
    public function itemsAction(Request $request)
    {
        $repo = $this->getDoctrine()->getRepository('AppBundle:Item');
        $items = $repo->findBy(array(), array('id' => 'desc'));

        return $this->render('item/list.html.twig', ['items' => $items]);
    }

    /**
     * @Route("/article/{id}", name="oneList")
     */
    public function oneItemAction(Request $request, $id)
    {
        $repo = $this->getDoctrine()->getRepository('AppBundle:Item');
        $item = $repo->find($id);

        $newComment = new Comment();
        $form = $this->createForm(CommentType::class, $newComment);
        $form->handleRequest($request);

        $repositoryComment = $this->getDoctrine()->getRepository('AppBundle:Comment');
        $comments = $repositoryComment->findBy(['article'=>$id], ['id' =>'desc']);

        $repositoryUsers = $this->getDoctrine()->getRepository('AppBundle:User');
        $users = $repositoryUsers->findAll();

        $session = new Session();
        if ($this->getUser()) {

            $newComment = new Comment();
            $form = $this->createForm(CommentType::class, $newComment);
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                $newComment = $form->getData();

                $newComment->setUser($this->getUser()->getId());
                $newComment->setArticle($id);
                $newComment->setDate(new \DateTime('now'));
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($newComment);
                $entityManager->flush();

                $session->getFlashBag()->add('infos', 'Commentaire publié !');

                return $this->redirectToRoute('oneList', ['id' => $id]);
            }

            $localReturn =[
                'users' => $users,
                'comments' => $comments,
                'item' => $item,
                'form' => $form->createView()
            ];
        } else {
            $localReturn =[
                'users' => $users,
                'comments' => $comments,
                'article' => $item
            ];
        }

        return $this->render('item/one.html.twig', $localReturn);
    }

    /**
     * @Route("/article/remove/{id}", name="removeArticle")
     */
    public function removeAction(Request $request, $id)
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $em = $this->getDoctrine()->getManager();
        $repo = $this->getDoctrine()->getRepository('AppBundle:Item');
        $item = $repo->find($id);
        $em->remove($item);
        $em->flush();

        return $this->redirectToRoute('list', []);
    }

    /**
     * @Route("/comment/remove/{id}", name="removeComment")
     */
    public function removeCommentAction(Request $request, $id){

        $this->denyAccessUnlessGranted('ROLE_USER');

        $session = new Session();

        $backRoute = $request->query->get('backRoute');
        $backRouteParameter = $request->query->get('backRouteParameter');

        $doctrine = $this->getDoctrine();
        $entityManager = $doctrine->getManager();
        $repository = $doctrine->getRepository('AppBundle:Comment');

        $comment = $repository->find($id);
        if($this->getUser()->getId() == $comment->getUser() or $this->getUser()->hasRole(ROLE_ADMIN)  ){

            $entityManager->remove($comment);
            $entityManager->flush();

            $session->getFlashBag()->add('infos', 'Commentaire supprimé !');

            return $this->redirectToRoute($backRoute, ['id'=>$backRouteParameter['id']]);
        }
        else{
            return $this->redirectToRoute('articles');
        }
    }

}