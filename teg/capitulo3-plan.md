# Plan Capítulo 3 - Pruebas y Aseguramiento de Calidad (Fecha objetivo: 13/05/2026)

## Estructura Propuesta para el Capítulo

### 3.1 Introducción y Estrategia de Pruebas
- Explicación del enfoque de calidad dentro del ciclo de vida del proyecto (migración de monolito a microservicios).
- Definición de la pirámide de pruebas aplicable: pruebas unitarias, de integración, de sistema (E2E) y pruebas de carga/estrés.

### 3.2 Pruebas Unitarias y de Integración (Backend)
- Uso de JUnit y Mockito para las pruebas unitarias de los servicios y controladores en Spring Boot.
- Pruebas de integración para validar la interacción entre los microservicios (UAA, Site, Notify, Paware) con Testcontainers.
- Seeding de datos (Data Seeding) para establecer un estado conocido antes de ejecutar las pruebas de integración.

### 3.3 Automatización de Pruebas End-to-End (E2E)
- **Comparación de Herramientas de Automatización:**
  - *Selenium WebDriver:* Estándar de la industria, altamente maduro, pero a menudo más lento y con configuraciones más complejas (manejo de esperas explícitas).
  - *Cypress:* Muy popular en ecosistemas JS, ejecución rápida directo en el navegador, pero con limitaciones en escenarios multi-pestaña o multi-dominio (aunque mejorando en versiones recientes).
  - *Playwright:* **Herramienta Seleccionada**. Desarrollado por Microsoft, soporte nativo para múltiples navegadores (Chromium, WebKit, Firefox), ejecución paralela rápida, auto-wait integrado, excelente manejo de iframes y contextos de navegador independientes (ideal para probar flujos de inicio de sesión UAA concurrentes).
- **Justificación:** Se seleccionó Playwright porque la arquitectura basada en microservicios y UAA requiere un manejo robusto de redirecciones de autenticación (SSO), y Playwright maneja las sesiones y el estado de la red de manera muy eficiente.

### 3.4 Pruebas de Carga y Rendimiento
- Herramientas a utilizar (por ejemplo, k6, JMeter o Gatling) para medir cómo se comportan los nuevos microservicios frente a picos de tráfico comparado con el monolito original.
- Configuración de escenarios para los flujos críticos (login, carga masiva de sitios, notificaciones concurrentes).

### 3.5 Monitoreo y Observabilidad en Pruebas
- Integración de PAWARE y el stack de observabilidad (Prometheus, Grafana, Loki) durante las pruebas.
- Validar que los errores simulados (Caos) generen los logs y alertas correctas.

### 3.6 Resultados y Análisis
- Cobertura de código alcanzada (Jacoco).
- Métricas de rendimiento obtenidas y lecciones aprendidas durante la automatización de E2E.
- Tiempos promedios de respuesta de las APIs críticas.

---

## Tareas para Completar antes del 13/05/2026
1. Escribir el borrador del Capítulo 3 siguiendo la estructura anterior en LaTeX.
2. Incorporar la comparativa de Playwright vs Selenium/Cypress como justificación metodológica.
3. Consolidar los resultados de los scripts de seeding para incluirlos como evidencia en el documento.