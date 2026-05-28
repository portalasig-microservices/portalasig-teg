# Referencias Pendientes — Estado de Verificación

## ✅ Confirmadas (curl OK)

### REF 1 — Kephart & Chess (2003)
- **DOI:** `10.1109/MC.2003.1160055` → redirige a IEEE Xplore (HTTP 302 → válido)
- **Mirror PDF:** ResearchGate (accesible según verificación manual, bloquea bots)
- **Estado:** LISTO para actualizar en .bib

### REF 2 — IBM White Paper (2006)
- **URL:** `https://users.cs.fiu.edu/~sadjadi/Teaching/Autonomic%20Grid%20Computing/CIS-6612-Summer-2006/AC-Blueprint-WhitePaper-V7.pdf`
- **Estado:** HTTP 200 OK (mirror universitario FIU)
- **Nota:** El enlace original de IBM está roto (404). Usar este mirror.

### REF 4 — Notaro et al. (2021) AIOps Survey
- **arXiv:** `https://arxiv.org/pdf/2106.02915.pdf` → HTTP 200, content-type: application/pdf
- **DOI ACM:** `10.1145/3471650` → HTTP 404 (paywall / no resuelve)
- **Estado:** LISTO. Usar arXiv como enlace principal.

### REF 5 — Mendonça et al. (2012)
- **DOI Elsevier:** `10.1016/j.jss.2012.05.001` → HTTP 302 → linkinghub.elsevier.com → 200 OK
- **CORE PDF:** roto (404 en fileserver)
- **Estado:** LISTO. Usar DOI directo.

### REF 6 — ISO/IEC/IEEE 14764:2006
- **ISO:** `https://www.iso.org/standard/39064.html` → HTTP 200
- **IEEE:** `https://standards.ieee.org/ieee/14764/2975/` → HTTP 200
- **Estado:** LISTO

---

## ❌ Necesita segunda búsqueda

### REF 3 — Weyns (2019) "Software Engineering of Self-Adaptive Systems"
- **DOI dado:** `10.1007/978-3-030-02906-2` → HTTP 404 (no existe o no resuelve)
- **Springer book page:** `https://link.springer.com/book/10.1007/978-3-030-02906-2` → HTTP 404
- **Springer PDF:** `https://link.springer.com/content/pdf/10.1007/978-3-030-02906-2.pdf` → HTTP 404 (requiere autenticación)
- **Problema:** El DOI y los enlaces de Springer no funcionan. Es posible que:
  1. El año sea diferente (2017, 2020, etc.)
  2. El título sea ligeramente diferente
  3. Sea un capítulo de libro en lugar de monografía
  4. El DOI tenga un prefijo/sufijo diferente
- **Acción requerida:** Buscar el DOI correcto en Google Scholar, Springer Link o DBLP.

---

## Formato para actualizar .bib

Por cada referencia confirmada, actualizar el campo `note` o `howpublished` en `references.bib`:

```bibtex
@article{kephart2003vision,
  ...
  doi={10.1109/MC.2003.1160055},
}

@article{ibm2006architectural,
  ...
  note={[Online]. Available: \url{https://users.cs.fiu.edu/~sadjadi/Teaching/Autonomic%20Grid%20Computing/CIS-6612-Summer-2006/AC-Blueprint-WhitePaper-V7.pdf}},
}

@book{weyns2019software,
  ...
  % PENDIENTE: DOI correcto no encontrado
}

@article{notaro2021aiops,
  ...
  note={[Online]. Available: \url{https://arxiv.org/pdf/2106.02915.pdf}},
}

@article{mendonca2012architecture,
  ...
  doi={10.1016/j.jss.2012.05.001},
}
```
