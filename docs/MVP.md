# Veil MVP specification

This document records the agreed product scope. It describes intended behavior, not verified implementation or platform feasibility. Collaboration and agent behavior are defined in [AGENTS.md](../AGENTS.md).

## Goal

Prove Veil's core masking interaction as a small native macOS menu bar utility for Bennett's own use and portfolio demos. Broader distribution is deferred.

Browsers are the initial motivating use case, particularly ads and distracting webpage sections. “Any application” is the long-term vision, not a verified MVP compatibility claim.

The MVP conceals unwanted regions without modifying the target application itself. Masking does not collapse the underlying layout or reclaim desktop space. Window cropping is a possible future direction.

## Interaction

- Veil lives in the menu bar and provides a popover.
- A keyboard shortcut starts drawing a rectangular mask over a target application window.
- Users toggle masks on and off through the menu bar popover. There is no shortcut for toggling or temporarily revealing masks in the MVP.
- Visible masks conceal the underlying region and block clicks to it. Turning masks off reveals the content and restores access to the underlying application.
- Users can delete a mask and draw a replacement. Direct manipulation to move or resize an existing mask is deferred.

## Appearance and geometry

- Automatically choose a solid colour that blends into the mask's surroundings when the mask is created.
- Pick the colour once. Continuous colour matching is out of scope. A manual colour picker is not a substitute for the agreed automatic selection.
- Keep each mask relative to its associated window, following window movement.
- Scale both mask position and size proportionally when the target window resizes.
- Track window geometry, not webpage content or individual interface elements. Scrolling does not make a mask follow an ad or other element.
- Proportional scaling only preserves coverage when the underlying content retains the same relative geometry. Responsive layouts, scrolling, and other content changes may require deleting and redrawing a mask.
- Respect target-window visibility and focus. A mask must not remain over unrelated windows when its target is covered, hidden, minimized, or no longer applicable. The mechanism needs investigation.

## State and supported environment

- Keep masks in memory. The MVP may forget all masks when Veil quits. Persistence and restoration across launches are deferred.
- Target ordinary application windows on a single display.
- Full-screen apps, multiple displays, Spaces transitions, and Stage Manager support are deferred.
- For individual-window versus application-wide association, use the simplest reliable approach established during prototyping and explain its behavior. Bennett has delegated that choice; a setting to choose between modes is deferred.

## Privacy and permissions

- Accessibility and Screen Recording permissions are acceptable if investigation establishes a need. Their actual requirements remain to be determined.
- Use sampled screen pixels transiently for colour selection, with the minimum necessary permissions.
- Accounts, backend services, telemetry, and other network features are outside the MVP.

## Technical investigation

Work through small experiments before committing to an architecture for:

- Associating a mask with its target window and detecting movement, resize, visibility, and focus changes.
- Maintaining correct stacking when ordinary windows overlap, without covering unrelated applications.
- Blocking clicks while a mask is visible and restoring interaction when it is off.
- Sampling an appropriate surrounding colour once.
- Delivering the drawing shortcut and selection flow without losing the intended target window.

The exact shortcut, colour-sampling strategy, association mechanism, popover controls, and permission or sandbox requirements remain open. These should be resolved through investigation rather than treated as settled architecture.

## Acceptance checks

Validate the relevant behavior in the supported environment:

- Start drawing with the shortcut, create a mask, and cancel an unfinished selection.
- Check that automatic colour selection blends into the intended surroundings and remains fixed afterward.
- Confirm that visible masks block clicks and toggling them off restores access to underlying content.
- Move and resize the target window; check that masks follow and scale proportionally.
- Cover, hide, minimize, and restore the target window; check that masks do not cover unrelated windows.
- Toggle masks through the menu bar popover, delete a mask, and draw a replacement.
- Quit and reopen Veil; masks need not survive the restart.

These are validation goals, not checks already performed. Build success alone does not demonstrate the visual or interaction behavior.

## Deferred and excluded scope

Future considerations include window cropping, persistent masks, content-aware tracking, continuous colour adaptation, direct mask moving/resizing, configurable association modes, broader window/display environments, and public distribution. Each requires a later scope decision.

Scratchpads, drawing canvases, and note-taking features are outside Veil's agreed product scope.
