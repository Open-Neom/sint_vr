# Changelog

## 0.3.0-dev.1 — Retired, local only

- Remove the implementation and move tests to their owning modules: lifecycle
  in vrlizate, SINT integration in neom_vr, generic navigation fixes in SINT.
- Keep only a deprecated export entry point, excluded from the SDK and app.
- Disable publishing. Preserve repository history and historical SDK archives.

## Unreleased

- Add SINT-based renderer sessions with serialized, idempotent lifecycle,
  terminal asynchronous cleanup and observable errors.
- Add `VrSessionHost` for route, application and ticker visibility, with isolated
  SINT registrations and ownership-safe disposal.
- Stop host tickers on failed or externally closed sessions, including closure
  while asynchronous initialization is pending; detach status listeners safely.
- Add explicit callback, widget-owned and Canvas engine session adapters.
- Add a VR host navigation delegate to synchronize SINT history with imperative
  Flutter renderer routes and back-navigation guards.
- Reuse registered engines in `VRController`; dispose only engines it creates,
  preserve existing frame callbacks and detach borrowed listeners on close.
- Make `VRBindings` tagged, idempotent and aware of externally owned services.
- Require published SINT 1.6.2 and VRlizate 1.12 APIs; keep the engine source
  override local to the SDK checkout.
- Replace overstated feature descriptions with the actual lifecycle/navigation
  and translation contracts. Add ownership and lifecycle regression tests.

## [0.2.0] - 2026-05-27

- Initial open-source release of SINT VR extensions.
- Integrated dependency injection wrappers for `vrlizate` scene management.
- Implemented high-performance stereoscopic translations and head-tracking gaze controls.
