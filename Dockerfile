# Stage 1: Build the WAR file using Ant
FROM tomcat:9.0-jdk21 AS builder
WORKDIR /app

# Install Apache Ant
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

# Copy the project files
COPY . .

# Build the project using Ant (this creates dist/book_store_-1.war)
RUN ant -Dj2ee.server.home=/usr/local/tomcat dist

# Stage 2: Deploy to Tomcat
FROM tomcat:9.0-jre21

# Remove default Tomcat applications to keep it clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the builder stage as ROOT.war 
# so it serves at the root path (/)
COPY --from=builder /app/dist/book_store_-1.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for Railway
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
