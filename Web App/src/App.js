import { Routes, Route } from "react-router-dom"
import Home from "./Components/Home"
import Projects from "./Components/Projects";
import AddProject from "./Components/AddProject";
import ShowProject from "./Components/ShowProject";
import { createContext, useMemo, useState } from "react";

export const UserContext = createContext({
  userName: [],
  setUserName: () => {},
});

function App() {
  const [userName, setUserName] = useState();

  const value = useMemo(
    () => ({ userName, setUserName }), 
    [userName]
  );
  
  return (
    <div className="App">
    <UserContext.Provider value={value}>
      <Routes>
        <Route path="/" element={ <Home/> } />
        <Route path="projects" element={ <Projects/> } />
        <Route path="addproject" element={ <AddProject/> } />
        <Route path="showproject" element={ <ShowProject/> } />
      </Routes>
      </UserContext.Provider>
    </div>
  )
}

export default App