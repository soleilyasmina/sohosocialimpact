import React from 'react';
import { Link } from 'react-router-dom';

const Nav = () => (
  <nav>
    <Link to="/" className="left">SSI</Link>
    <Link to="/">Home</Link>
    <Link to="/about">About</Link>
    <a href="mailto:sohosocialimpact@gmail.com">Contact</a>
    <a href="https://instagram.com/soho.social.impact">
      <i class="fab fa-instagram"></i>
    </a>
  </nav>
);

export default Nav;
