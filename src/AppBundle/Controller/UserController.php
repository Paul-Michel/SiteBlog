<?php

namespace AppBundle\Controller;

use AppBundle\Form\Type\ItemType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\Item;
use FOS\UserBundle\Model\User;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Session\Session;


class UserController extends Controller
{
    /**
     * @Route("/panel", name="panel")
     */
    public function panelAction(Request $request)
    {
        $repo = $this->getDoctrine()->getRepository('AppBundle:User');
        $users = $repo->findBy(array(), array('roles' => 'desc'));

        return $this->render('item/panel.html.twig', ['users' => $users]);
    }

    /**
     * @Route("/panel/remove/{id}", name="removeUser")
     */
    public function removeUser(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $repo = $this->getDoctrine()->getRepository('AppBundle:User');
        $user = $repo->find($id);
        $em->remove($user);
        $em->flush();

        return $this->redirectToRoute('panel', []);
    }
}
