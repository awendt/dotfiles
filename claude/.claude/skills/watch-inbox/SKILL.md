---
name: watch-inbox
description: Receive terminal output I share from tmux instead of asking me to paste it. Use when I'll run commands for you (e.g. on a server), when I say I shared or will share output, or when I invoke /watch-inbox.
---

I share terminal output from tmux on purpose with `C-a C-a C-y`. Never read my tmux panes yourself and never send keys to tmux.

Each share is saved as a file in `~/.claude-share/` with secrets masked, and its path is appended to `~/.claude-share/inbox`.

1. Start a persistent Monitor, unless one is already running:

       mkdir -p ~/.claude-share && touch ~/.claude-share/inbox && tail -n0 -F ~/.claude-share/inbox

2. On each event, Read the file at that path and continue the task with it. Never ask me to paste output.
3. If I say I shared something and no event arrived, Read the newest file in `~/.claude-share/`.
4. A share is the visible screen only. If the output you need scrolled off, ask me to rerun it piped through `tail` or `less`.
