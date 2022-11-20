import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import { db } from '../firebase';
import firebase from 'firebase/compat/app';
import { useNavigate } from "react-router-dom";
import './css/AddProject.css'

function AddProject() {

  const [title,setTitle] = useState("");
  const [author,setAuthor] = useState("");
  const [email,setEmail] = useState("");
  const [about,setAbout] = useState("");
  const [link,setLink] = useState("");
  const [category,setCategory] = useState("");
  const [description,setDescription] = useState("");
  const [image,setImage] = useState("");
  let navigate = useNavigate();

  const addProject = (e) => {

    if(title === "" || author ==="" || email === "" || about==="" || category==="" || description==="") {
      alert("Please enter all the fields");    }

      else {

      db.collection('projects').add({
        About: about,
        Author: author,
        Category: category,
        Description: description,
        email: email,
        timestamp: firebase.firestore.FieldValue.serverTimestamp(),
        Image: image? image: "https://media.istockphoto.com/id/1130786754/photo/light-bulb-on-yellow-background.jpg?b=1&s=170667a&w=0&k=20&c=DsxiDhh3rsTARBH7pS1_yPnUfgAirSO2JpWo7f63iss=",
        Links: link,
        Title: title,
    });
    }

        setAuthor("");
        setTitle("");
        setEmail("");
        setAbout("");
        setDescription("");
        setImage("");
        setLink("");
        setCategory("");

        navigate("/Projects");
  }

  return (
    <div className="addProject">

      <div className="addProject__Header">
        <Link className="addProject__Link" to="/">
            <h1 className="addProject__HeaderTitle">Ideagram</h1>
        </Link>

            <div className="addProject__HeaderButtons">
            <Link className="addProject__Link" to="/projects">
                <div className="projects__Button">Go Back</div>
            </Link>
            </div>
      </div>

      <div className="addProject__inputsContainer">

          <div className="addProject__mainFields">
            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">Project Title*</h2>
              <div className="addProject__inputFieldContainer">
              <input required className="addProject__inputField" onChange={(e) => setTitle(e.target.value)} value={title} placeholder="Enter title here" type="text" />
              </div>
             
            </div>
            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">Name of Author*</h2>
              <div className="addProject__inputFieldContainer">
              <input required className="addProject__inputField" onChange={(e) => setAuthor(e.target.value)} value={author} placeholder="Enter author here" type="text" />
              </div>
            </div>

            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">Email*</h2>
              <div className="addProject__inputFieldContainer">
              <input required className="addProject__inputField" onChange={(e) => setEmail(e.target.value)} value={email} placeholder="Enter email here" type="text" />
             </div>
              
            </div>

            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">About (1 line)*</h2>
              <div className="addProject__inputFieldContainer"> 
              <input required className="addProject__inputField" onChange={(e) => setAbout(e.target.value)} value={about} placeholder="Enter about here" type="text" />
              </div>
              
            </div>

            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">Link</h2>
              <div className="addProject__inputFieldContainer"> 
              <input className="addProject__inputField" onChange={(e) => setLink(e.target.value)} value={link} placeholder="Enter Github/Blog links here" type="text" />
              </div>
            
            </div>

            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">Image URL</h2>
              <div className="addProject__inputFieldContainer"> 
              <input className="addProject__inputField" onChange={(e) => setImage(e.target.value)} value={image} placeholder="Enter Image URL here" type="text" />
              </div>
              
            </div>

            <div className="addProject__mainFieldSingle">
              <h2 className="addProject__label">Category*</h2>
              <div className="addProject__inputFieldContainer">
              <input required className="addProject__inputField" onChange={(e) => setCategory(e.target.value)} value={category} placeholder="DIY/ App/ Web/ ML/ Other" type="text" />
               </div>
              
            </div>
          </div>

      <div className="addProject__description">

        <div className="appProject__descriptionContainer"> 
          <h2 className="addProjects__descriptionTitle">Description*</h2>
          <div className="addProjects__descriptionInputContainer">
            <textarea onChange={(e) => setDescription(e.target.value)} value={description} placeholder="Start describing here :)" className="addProjects__descriptionTextArea"></textarea>
            </div>
          </div>

          <div onClick={addProject} className="addProject__Submit">Submit</div>
      </div>

      </div>

    </div>
  )
}

export default AddProject