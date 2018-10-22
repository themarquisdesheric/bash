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