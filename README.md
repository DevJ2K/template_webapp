# template_webapp
My template for my webapp. I use Python in Backend + Vue.js in Frontend.

## Overview

# Try the project

## Using Webapp

### 1. Install Docker

To run the project, you'll first need to install [Docker](https://docs.docker.com/engine/install/) on your computer.

### 2. Install Make (Optional)

The project use a Makefile to run the docker and avoid you to type manually the command. You can follow this [link](https://www.gnu.org/software/make/#download) to install `make` or search by yourself. But is optional.

### 3. Run the webapp
#### With Make
Run this command in your terminal :
```
make
```
Will display this :

<img src="/gitimages/make_output.png" width="75%">

Run this to run the webapp :
```
make run
```

#### Without Make
Run this command to run the webapp :
```
docker-compose -f docker-compose.yml build
```

## Project only
### 1. Go in project folder
You can use this [link](https://github.com/DevJ2K/template_webapp/tree/main/backend/project_name)



<!-- ## Todo-list
- [ ] Update current and project README.md.
- [x] Change colors Host link in display_project
- [x] Download project link?
- [x] Computorv1 -> Project_name in frontend/app/.../HomeView.vue
- [x] Use Args in Dockerfile
- [x] Add colors to Makefile -->
