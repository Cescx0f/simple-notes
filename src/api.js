import axios from 'axios';
import router from './router'


const instance = axios.create({
    baseURL: 'http://localhost:8087/api',
    headers: {
      "Access-Control-Allow-Origin": "*",
      'content-type': 'application/json', 
      "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
      "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token"
    }
  });

  instance.interceptors.response.use(response => {
    return response;
 }, error => {
   if (error.response.status === 401) {
        router.push({name: 'login'});
   }
   return error;
 });

function login(email, password){
    return instance.post('user/login', {
        email,
        password,
    }).then((resp) => {
        instance.defaults.headers.common['authorization'] = `${resp.data.data.jwt}`;
        return resp;
    })
}

function register(email, nickname, password){
    return instance.post('user/register', {
        email,
        nickname,
        password,
    });
}

function getMe(){
    return instance.get('user/me');
}

function getCourses(){
    return instance.get('courses/all');
}

function createCourse(name, description){
    return instance.post('courses/create', {
        name,
        description
    });
}

function deleteCourse(id){
    return instance.post('courses/delete', {
        id,
    });
}

function deleteLesson(id){
    return instance.post('lessons/delete', {
        id,
    });
}

function deleteNote(id){
    return instance.post('notes/delete', {
        id,
    });
}

function getLessons(){
    return instance.get('lessons/all');
}

function createLesson(name, description, courseId, date){
    return instance.post('lessons/create', {
        name,
        description,
        courseId,
        date,
    });
}

function getNotes(){
    return instance.get('notes/all');
}

function getMyNotes(){
    return instance.get('notes/my');
}

function createNote(title, description, lessonId){
    return instance.post('notes/create', {
        title,
        description,
        lessonId,
    });
}

function getNoteDetails(noteId){
    return instance.get('notes/details',
    {params:{
        noteId,
    }});
}

function getNotesByLesson(lessonId){
    return instance.get('notes/bylesson',
    {params:{
        lessonId,
    }});
}

function editNote(noteId, title, description, content){
    return instance.post('notes/edit', {
        title,
        description,
        noteId,
        content,
    });
}

function search(query){
    return instance.get('search/', {
        params: {query},
    });
}
function getHistory(){
    return instance.get('history/');
}




export {
    login,
    getMe,
    register,
    ///
    getCourses,
    createCourse,
    deleteCourse,
    ///
    getLessons,
    createLesson,
    deleteLesson,
    ///
    getNotes,
    getMyNotes,
    createNote,
    getNoteDetails,
    getNotesByLesson,
    editNote,
    deleteNote,
    ///
    search,
    ///
    getHistory
}