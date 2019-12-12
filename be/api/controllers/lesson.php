<?php

class LessonController{

    public static function handleRequest($request){
        if($request->isMethod('get')){
            if ($request->isAction('all')) {
                LessonController::getAll($request);
            }
            if ($request->isAction('related')) {
                LessonController::getRelated($request);
            }
        }
        if($request->isMethod('post')){
            if ($request->isAction('create')) {
                LessonController::create($request);
            }
        }
    }

    private static function getAll($request) {
        $user =  Auth::authMiddleware($request);
        $courses = $_SESSION['database']->getAllLessons();
        Response::send(200, array($courses));
    }

    private static function getRelated($request) {
        $user =  Auth::authMiddleware($request);

        $data = $request->getData();

        $courseId = $data->courseId;

        if (empty($courseId)) {
            Response::send(422, array("error" => "missing fields"));
        } else {
            $courses = $_SESSION['database']->getLessonsByCourse($courseId);
            Response::send(200, array($courses));
        }
    }

    private static function create($request) {
        $user =  Auth::authMiddleware($request);
        $data = $request->getData();

        $name = $data->name;
        $description = $data->name;
        $courseId = $data->courseId;

        if (empty($name) | empty($description)) {
            Response::send(422, array("error" => "missing fields"));
        } else {
            $courseExists = $_SESSION['database']->getCourseById($name);
            $lessonExists = $_SESSION['database']->lessonExists($name);
            if (!$lessonExists) {
                $created = $_SESSION['database']->createLesson($name, $description, $courseId, $user);
                Response::send(200, (array) $created);
            }
        }
    }
}