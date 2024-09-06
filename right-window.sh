current_workspace=$(hyprctl monitors -j | jq -r ".[0].activeWorkspace.id");
if [ "$current_workspace" -lt 10 ]; then
    next_workspace=$((current_workspace + 1));
    hyprctl dispatch workspace $next_workspace;
fi
