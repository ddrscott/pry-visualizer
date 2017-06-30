let events = [];
let listeners = [];

const addEvent = event => {
  events = events.concat(event);
  listeners.forEach(l => l(events));
  console.log(event);
}

export default {
  get events() { return events; },

  on(listener) {
    if (listeners.indexOf(listener) === -1)
      listeners.push(listener);
  },

  off(listener) {
    listeners = listeners.filter(l => l !== listener);
  }
}

const ws = new WebSocket(`ws://${location.host}`);
ws.onmessage = ({ data }) => {
  if (data.charCodeAt(0) === 123 /* { */) {
    addEvent(JSON.parse(data));
  }
};
