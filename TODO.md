# Tareas Pendientes - Trabajo Especial de Grado

## Documento LaTeX (teg/)
- [ ] **Capítulo 1:** Leer y limpiar los objetivos, metodología y justificación que quedaron heredados del Seminario original para asegurar que reflejan 100% lo construido en PAWARE.
- [ ] **Capítulo 2:** (TODO) Simplificar y resumir. El marco teórico quedó muy extenso en comparación con los otros capítulos. Se recomienda condensar las secciones de observabilidad y microservicios para mantener el balance en el documento.
- [ ] **Capítulo 3:** Elaborar y agregar un diagrama de arquitectura (ej. draw.io) que muestre la red de microservicios, el API Gateway, ms-uaa, ms-site, ms-notify y PAWARE. Reemplazar el placeholder `\includegraphics`.
- [ ] **Capítulo 4:** Tomar los screenshots (Frontend de Alertas PAWARE con Chat, correo de alerta en MailHog, pruebas E2E Cypress y Coverage de JaCoCo) y agregarlos donde dejé los `[Placeholder: ...]`.

## PAWARE / Backend
- [ ] **Conexión real LLM:** Restaurar la conexión del backend con la API de OpenAI/Gemini quitando el `MockChatGateway` temporal y resolviendo la regla de red/proxy de Docker que estaba causando el timeout (`Read timed out` en el host 172.17.0.1:3128).

## Frontend (Vue)
- [ ] **Limpieza de Chat:** El componente `PawareAlerts.vue` tiene un `setTimeout` con la respuesta quemada (mock). Cuando se repare el backend, revertir al bloque `try-catch` original que hace la petición real con Axios.

## Pruebas y Aseguramiento de Calidad
- [ ] **Repositorio de Automatización:** Formalizar el repositorio `portalasig-e2e`. Completar los scripts de Cypress (login, creación de sitios) para que la ejecución E2E sea robusta y esté lista para el pantallazo final.
- [ ] **Verificar Cobertura de Código (JaCoCo):** Revisar el HTML generado por JaCoCo en `paware/server/target/site/jacoco/index.html` para validar empíricamente que el porcentaje de cobertura de las pruebas de integración sea alto. Si es necesario, agregar más casos de prueba en PAWARE para inflar el número antes de tomar la captura para el Capítulo 4.

## Migración y Modelado de Datos
- [ ] **Análisis de BD (Monolito vs Microservicios):** Analizar la estructura de la base de datos del monolito original frente a los nuevos esquemas distribuidos (`patest` separados por servicio).
- [ ] **Estrategia de Migración:** Diseñar y probar los scripts/procedimientos para transformar y migrar los datos históricos de forma sencilla al nuevo ecosistema descentralizado.
- [ ] **Redacción en la Tesis (Capítulo 3):** Escribir una sección concisa que destaque el "cambio brutal" del modelo de datos centralizado a la gestión descentralizada de bases de datos (un principio clave de microservicios), explicando la transformación sin excederse en longitud para no desbalancear el documento.
