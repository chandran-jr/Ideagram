import React, { useEffect, useState, useContext } from 'react';
import { Link } from 'react-router-dom';
import './css/Projects.css';
import Project from './Project';
import {db} from '../firebase';
import { useNavigate } from "react-router-dom";
import { UserContext } from '../App';

export default function Projects() {
    const [posts,setPosts] = useState([]);

    const { userName, setUserName } = useContext(UserContext);
    
    let navigate = useNavigate();

    useEffect(() => {
        db.collection("projects").orderBy('timestamp', 'desc').onSnapshot((snapshot) => 
            setPosts(snapshot.docs.map((doc) => ({
                id: doc.id,
                data: doc.data(),
                
            })
        ))
        );
    },[]);

    const clickTile = (title) => {
          for(let i = 0; i<posts.length;i++) {
            if(posts[i].data.Title === title) {
                setUserName(posts[i].data);
                break;
            }  
          }

          navigate("/ShowProject");
          console.log(userName);
    };

    

  return (
    <div className="projects">

        <div className="projects__Header">
        <Link className="projects__Link" to="/">
            <h1 className="projects__HeaderTitle">Ideagram</h1>
        </Link>

            <div className="projects__HeaderButtons">
            <Link className="projects__Link" to="/">
                <div className="projects__Button">Home</div>
            </Link>
            <Link className="projects__Link" to="/addproject">
                <div className="projects__Button">New Project</div>
            </Link>
            </div>
        </div>

        <div className="projects__Container">
        {posts.map(({id, data:{About,Author,Category,Description,Image,Links,Title,email,timestamp}}) => (
                <Project
                    key={id}
                    About={About}
                    Author={Author}
                    Category={Category}
                    Description={Description}
                    Image={Image}
                    Links={Links}
                    Title={Title}
                    Email={email}
                    timestamp={timestamp}
                    clickTile={clickTile}
                />
            ))}
        </div>

    </div>
  )
}