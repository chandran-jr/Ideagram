import React from 'react';
import './css/Project.css';

function Project({About,Author,Category,Description,Image,Links,Title,timestamp,clickTile}) {
  return (
    <div onClick={() => {clickTile(Title);}} className="project">
        
        <div className="project__image" >
            <img className="project__imageUrl" src={Image} alt="" />
        </div>

        <h2 className="project__Title">{Title}</h2>

        <div className="project__Description">
            {About}
        </div>

        <div className="project__typeAuthor">
            <div className="project__Type">
                {Category}
            </div>

            <div className="project__Author">{Author}</div>

        </div>
        
    </div>
  )
}

export default Project