import React, { Component } from 'react';
import './App.css';
import PanelSplit from './components/PanelSplit';
import PryEvents from './services/PryEvents';

export default class extends Component {
  constructor(){
    super();
    this.state = {
      selected: undefined,
      visibleEvents: []
    };
  }

  render() {
    const { selected, visibleEvents } = this.state;
    return (
      <div className='App'>
        <PanelSplit
          a={height =>
              <div>
                TOP
              </div>
          }
          b={
            <div>
              Bottom
            </div>
          }
        />
    </div>
    )
  }
}
