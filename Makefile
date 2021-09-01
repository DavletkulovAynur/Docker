mongo:
	docker run -p 27017:27017 \
			-d \
			--rm \
			--name mongodb \
			--network notes-net \
			--env-file ./config/development.env \
			-v mongo-data:/data/db \
			mongo
backend:
	docker run -p 5000:5000 \
			--rm \
			-d \
			--name notes-backend-container \
			--network notes-net \
			-v /Users/davletkulovaynur/Documents/projects/docker-mern/server:/app \
			-v /app/node_modules \
			--env-file ./config/development.env \
			notes-backend
front:
	docker run -p 3000:3000 \
			-d \
			--rm \
			--name notes-frontend-container \
			-v /Users/davletkulovaynur/Documents/projects/docker-mern/client/src:/app/src \
			notes-frontend
stop:
	docker stop notes-frontend-container notes-backend-container mongodb

dev:
	docker-compose -f docker-compose.yml up -d

stop:
	docker-compose down
build:
	docker-compose -f docker-compose.production.yml build