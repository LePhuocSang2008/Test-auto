
import './App.css';
import './styles/home.css'
import './styles/lixi.css'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Home/Home';
import About from './pages/About/About';
import Contact from './pages/Contact/Contact';
import NotFound from './pages/NotFound/NotFound'; 

function App() {

return (
 <Router>
      <div>
        {/* Phần định nghĩa đường dẫn */}
        <Routes>
          <Route exact path="/" element={<Home />} />  {/* Trang chủ */}
          <Route path="/about" element={<About />} />  {/* Trang giới thiệu */}
          <Route path="/contact" element={<Contact />} />  {/* Trang liên hệ */}
          <Route path="*" element={<NotFound />} />  {/* Trang lỗi 404 */}
        </Routes>
      </div>
    </Router>
);
}

export default App;