export default function messagesReducer(state = null, action) {
  switch (action.type) {
    case 'FETCH_MESSAGES':
      return action.payload;
    case 'MESSAGE_POSTED':
      const copiedState = state.slice(0);
      copiedState.push(action.payload);
      return copiedState;
    case 'CHANNEL_SELECTED':
      return []; // Channel has changed. Clearing view.
    default:
      return state;
  }
}
