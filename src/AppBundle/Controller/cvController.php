<?php
/**
 * Created by PhpStorm.
 * User: PGARZARO
 * Date: 14/01/2018
 * Time: 01:17
 */

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


class cvController extends Controller
{
    /**
     * @Route("/cv", name="cv")
     */
    public function cvAction(Request $request){
        return $this->render('item/cv.html.twig',[]);
    }
}