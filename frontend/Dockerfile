# --- Stage 1: Build the React App ---
FROM node:20-alpine as build-stage

WORKDIR /app

# Copy package files and install dependencies
# We do this separately to use Docker's layer caching
COPY package*.json ./
RUN npm install

# Copy the rest of the code and build it
COPY . .
RUN npm run build

# --- Stage 2: Serve with Nginx ---
FROM nginx:stable-alpine

# Copy the build output from Stage 1 to Nginx's HTML folder
COPY --from=build-stage /app/build /usr/share/nginx/html

# Copy a custom Nginx config if needed (we'll use the default for now)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]