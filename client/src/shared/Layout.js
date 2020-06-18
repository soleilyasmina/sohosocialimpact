import React from 'react';

import Footer from './Footer';
import Nav from './Nav';

const Layout = ({ children }) => {
  return (
    <div className="brain">
      <Nav />
      {children}
      <Footer />
    </div>
  )
}

export default Layout;
