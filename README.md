# sint_vr — retirado

Desde el refactor local del 4 de octubre de 2026 este módulo no mantiene una
implementación propia y no forma parte de VRlizate App ni del SDK preview.2.
Se conserva el repositorio y su historial. La entrada de biblioteca queda como
puente de migración de solo exports, marcado obsoleto y con publicación desactivada.
No es un sustituto compatible de todas las APIs anteriores.

| Responsabilidad anterior | Destino único |
| --- | --- |
| Estado, inyección, navegación y traducciones generales | `sint` |
| `VrSintDelegate` | `SintDelegate` del checkout SINT 1.7.0-dev.1 |
| `VrSessionController`, `VrSessionHost`, adapters | `vrlizate` 1.13.0 |
| Registro de sesiones en SINT | `NeomVrSessionController` y `NeomVrSessionHost` en `neom_vr` 1.4.0 |
| `VRController`, `VRSceneState`, `VRBindings`, `VRNavigator`, `VRRoutes`, textos VR | `neom_vr` 1.4.0 |

## Migración

- Cambiar dependencia/import a `package:neom_vr/neom_vr_sessions.dart` en la app
  oficial; usar `NeomVrSessionHost` para sesiones registradas en SINT.
- El puente SINT recibe `NeomVrSessionController(session: coreSession)`. No es
  dueño del controlador core: lo cierra, pero el propietario libera sus listeners.
- En un reproductor independiente importar `package:vrlizate/vrlizate.dart` y
  usar `VrSessionHost` sin SINT. El estado core es un `ValueListenable`; el puente
  de `neom_vr` ofrece la proyección Rx para consumidores SINT.
- Cambiar `VrSintDelegate` a `SintDelegate`. La corrección de navegación está en
  SINT, sin vocabulario VR. Los imports internos antiguos dejan de existir.
- Las pruebas migraron a los tres módulos propietarios. No queda un segundo
  manejador de estados ni otra implementación de pausa/reanudación aquí.

Estas versiones son cambios locales pendientes de publicación. El SDK mínimo
no requiere este puente ni `neom_vr`/Open Neom. El ZIP preview.1 se conserva como
artefacto histórico inmutable.
