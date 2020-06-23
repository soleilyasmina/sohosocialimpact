import React from 'react';
import { Route, Switch } from 'react-router-dom';

import About from './pages/About';
import Layout from './shared/Layout';

import './App.css';

function App() {
  return (
    <Layout>
      <body className="App">
        <Switch>
          <Route exact path="/" render={() => (
            <h1>Home</h1>
          )} />
          <Route exact path="/about" render={() => (
            <About />
          )} />
          <Route exact path="/contact" render={() => (
            <h1>Contact</h1>
          )} />
        </Switch>
      </body>
    </Layout>
  );
}

export default App;
