import './css/Home.css';
import { Link } from "react-router-dom";

function App() {
  return (
    <div className="home">

    <div className="home__Container"></div>
    
    <div className="home__Components" >
       <h2 className="home__Heading">Ideagram</h2>
       <h3 className="home__subHeading">A home for your ideas</h3>
       <Link className="home__Link" to="projects">
       <div className="home__Button">Go to Projects</div>
       </Link>
    </div>
       
    </div>
  );
}

export default App;
