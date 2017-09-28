import React from 'react';
import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';

const App = (props) => {
  return (
    <div className="messaging-wrapper">
      <div className="logo-container">
        <img className="messaging-logo" src={props.logoPath} />
      </div>
      <ChannelList />
      <MessageList />
    </div>
  );
};

export default App;
