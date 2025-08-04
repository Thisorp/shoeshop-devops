# Sử dụng image Java phù hợp với Mac M1 và MySQL 8
FROM eclipse-temurin:17-jdk-jammy

# Cài thêm netcat để đợi MySQL container
RUN apt-get update && apt-get install -y netcat

# Copy app jar và script chờ DB
COPY target/*.jar app.jar
COPY wait-for-mysql.sh /wait-for-mysql.sh
RUN chmod +x /wait-for-mysql.sh

# Chạy script wait trước khi khởi động app
ENTRYPOINT ["/wait-for-mysql.sh", "java", "-jar", "/app.jar"]
