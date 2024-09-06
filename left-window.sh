current_workspace=$(hyprctl monitors -j | jq -r ".[0].activeWorkspace.id");
if [ "$current_workspace" -gt 1 ]; then
    prev_workspace=$((current_workspace - 1));
    hyprctl dispatch workspace $prev_workspace;
fi
