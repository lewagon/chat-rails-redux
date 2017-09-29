// external modules
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import { createHistory as history } from 'history';
import logger from 'redux-logger'
import ReduxPromise from 'redux-promise';

// internal modules
import './assets/stylesheets/application.scss';
import App from './components/app';

// State and reducers
import messagesReducer from './reducers/messages_reducer';

// DOM anchor
const chatContainer = document.getElementById('chat_app');

const initialState = {
  messages: [],
  channels: JSON.parse(chatContainer.dataset.channels).map(c => c.name),
};

const reducers = combineReducers({
  messages: messagesReducer,
  channels: (state = null, action) => state
});

// Middlewares
const middlewares = applyMiddleware(logger, ReduxPromise);
const store = createStore(reducers, initialState, middlewares);

// render an instance of the component in the DOM
ReactDOM.render(
  <Provider store={store}>
    <Router history={history}>
      <Switch>
        <Route path="/channels/:channel" component={App} />
      </Switch>
    </Router>
  </Provider>,
  chatContainer
);
