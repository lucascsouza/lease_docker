# How to Setup

### Docker
1. First clone this project to your local enviroment:
```
git clone git@github.com:lucascsouza/lease_docker.git
```
2. Navigate to the new folder
3. If you want, you can change your database name and root password by changing the values inside the`.env` file.
4. Run the shell script to get both applications (frontend and backend) and iniatilize the docker containers.
```
./start.sh
```
### Backend Application
1. Access the new php-fpm container:
```
docker exec -it php-fpm bash
```
2. Edit the .env file to set database variables (for database and password use the same set on step 3):
```
DB_HOST=db
DB_DATABASE=leaseweb
DB_USERNAME=root
DB_PASSWORD=root
```
3. Install composer packages:
```
composer install
```

4. Add the app key and run the migrations
```
php artisan key:generate && php artisan migrate
```

5.Create an API Credential for the frontend app authentication (**store the token provided by the command, you'll need to use it later**):
```
php artisan api:create-list-frontend-credentials
```
6. Run the Server XLS Importation command:
```
php artisan import:xls-server-list
```
7. Set the permissions for storage folder:
```
chown -R www-data:www-data storage
```

#### Now your backend should be all set and ready

### Frontend Application
1. Navigate to `/src/lease_front/` and edit the `.env.local` file with the correct data:
```
VITE_ACCESS_API_TOKEN=TOKEN_OBTAINED_ON_STEP_5_OF_BACKEND
VITE_API_BASE_URL="http://leaseweb.localhost/api"
```
2. Install npm packages:
```
npm i
```
3. Run npm into dev mode:
```
npm run dev
```
4. Edit your hosts file and add:
```
127.0.0.1       leaseweb.local
```

5. Access the `http://leaseweb.local:5173` to check the application up and runing