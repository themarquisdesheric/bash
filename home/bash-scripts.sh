#!/bin/bash

# create a new Create React App project using a given name
# cleans up some of the defaults
function cra() {
  if [ -z $1 ]; then
    echo -e "\n Usage: cra \033[36m<project-name> \033[00m \n"
    return
  fi
  
  create-react-app $1
  cd $1

  rm src/App.css src/serviceWorker.js src/logo.svg
  
  echo "import React from 'react';" > src/index.js
  echo "import ReactDOM from 'react-dom';" >> src/index.js
  echo "import App from './App';" >> src/index.js
  echo -e "import './index.css'; \n" >> src/index.js
  echo "ReactDOM.render(<App />, document.getElementById('root'));" >> src/index.js

  echo -e "import React from 'react'; \n" > src/App.js
  echo "export default () => <h1 style={{ textAlign: 'center' }}>Happy Hacking!</h1>;" >> src/App.js
  > src/index.css

  git add .

  git commit -m "initial cleanup of create-react-app"

  yarn start
}

function greet() {
  LOOPING=true

  while $LOOPING; do
    echo "What is your name?"
    read NAME
    NO_RESPONSE_COUNT=0

    if [[ -z $NAME ]]; then
      echo "ALL YOU HAD TO DO WAS GIVE ME YOUR NAME :("
      echo "Let's try this again..."

      
    elif [[ -n $NAME ]]; then
      if [[ NO_RESPONSE_COUNT -eq 0 ]]; then
        echo "OH HELLO THERE, $NAME"
        echo "That only took $NO_RESPONSE_COUNT tries..."
      fi

      LOOPING=false
    fi
  done
}
