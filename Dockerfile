FROM node:18
WORKDIR /app

# Copy dependency files
COPY package.json package-lock.json ./

# Install specific dependencies first
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps

# Install all other dependencies
RUN npm install --legacy-peer-deps

# Copy all app files
COPY . .

# Environment variables
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
