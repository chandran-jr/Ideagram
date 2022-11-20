import React, { useContext } from 'react';
import { Link } from 'react-router-dom';
import { UserContext } from '../App';
import './css/ShowProject.css'


function ShowProject() {
  const { userName } = useContext(UserContext);
  console.log(userName);

  return (
    <div className="showProject">

      <div className="showProject__Header">
      <div className="showProject__Header">
        <Link className="showProject__Link" to="/">
            <h1 className="showProject__HeaderTitle">Ideagram</h1>
        </Link>

            <div className="showProject__HeaderButtons">
            <Link className="showProject__Link" to="/projects">
                <div className="showProject__Button">Back</div>
            </Link>
            </div>
        </div>
      </div>


      <div className="showProject__Container">

        <div className="showProject__Left">

          <div className="showProject__ImageContainer">
            <img className="showProject__Image" src={userName.Image} alt="" />
          </div>

          <h2 className="showProject__Title">{userName.Title}</h2>

          <div className="showProject__CategoryAuthor">
            <div className="showProject__Category">{userName.Category}</div>
            <div className="showProject__Author">By {userName.Author}</div>
          </div>

          <h3 className="showProject__Connect">
            Connect with the author here 👇
          </h3>

          <div className="showProject__Email">
           <a className="showProject__EmailLink" href={`mailto:${userName.email}`}> 📩 {userName.email} </a>
          </div>
        </div>


      <div className="showProject__Right">

          <div className="showProject__Description">
            {userName.Description}
          </div>

          <div className="showProject__Links">
            <h1 className="showProject__LinkText">Link:</h1>
            <div className="showProject__LinkBox">
             <a className="showProject__Link" href={userName.Links}> {userName.Links} </a> 
            </div>
          </div>
      </div>

      </div>

    </div>
  )
}

export default ShowProject