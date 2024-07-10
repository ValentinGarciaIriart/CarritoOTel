FROM openjdk:11.0.2-jre-slim

# Set the working directory
WORKDIR /app

# Copy the application JAR
COPY target/microservice-kubernetes-demo-order-0.0.1-SNAPSHOT.jar /app/
COPY opentelemetry-javaagent.jar /app/opentelemetry-javaagent.jar

# Configuration and start command including the OpenTelemetry agent
CMD ["/usr/bin/java", "-Xmx400m", "-Xms400m", \
  "-javaagent:/app/opentelemetry-javaagent.jar", \
  "-Dotel.service.name=OrderOtel", \
  "-Dotel.traces.exporter=otlp", \
  "-Dotel.metrics.exporter=otlp", \
  "-Dotel.logs.exporter=otlp", \
  "-Dotel.exporter.otlp.endpoint=https://c3b8fc46b53644bd9a34a844b2473cf1.apm.eastus2.azure.elastic-cloud.com:443", \
  "-Dotel.exporter.otlp.headers=Authorization=Bearer uYOVqj6gdRfYmuvvt1", \
  "-Dotel.resource.attributes=service.name=shoporder,service.version=1.0,deployment.environment=Otel", \
  "-jar", "/app/microservice-kubernetes-demo-order-0.0.1-SNAPSHOT.jar"]

# Expose the port the application runs on
EXPOSE 8080
