---- MONITORS ----
hl.monitor({
    output   = "",
    mode     = "2560x1440@165",
    position = "auto",
    scale    = "auto",
    vrr      = 0,
})

---- AUTOSTART ----
hl.on("hyprland.start", function () 
   hl.dispatch(hl.dsp.focus({ workspace = "name:web"}))
   hl.exec_cmd("noctalia")
   hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("systemctl --user import-environment &")
   hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
   hl.exec_cmd("dbus-update-activation-environment --systemd &")
 end)

---- ENVIRONMENT VARIABLES ----
hl.env("XCURSOR_SIZE", "36")
hl.env("HYPRCURSOR_SIZE", "36")
hl.env("XCURSOR_THEME", "LyraB-cursors")
hl.env("HYPRCURSOR_THEME", "LyraB-cursors")
hl.env("MOZ_ENABLE_WAYLAND", "1")
--QT Variables
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
--Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
--XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
--Grimblast Screenshot Directory
hl.env("DEFAULT_TARGET_DIR", "/home/jake/Pictures/Screenshots")

---- DECORATION ----
hl.config({
    decoration = {
        rounding           = 10,
        rounding_power     = 2,
        active_opacity     = 0.9,
        inactive_opacity   = 0.9,
        fullscreen_opacity = 1,
        shadow = {
            enabled = false,
        },
        blur = {
            variant = {
                glass = {

                }
            },
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.1696,
            popups = true,
            new_optimizations = true,
        },
    },
    general = {
        gaps_in  = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border   = "rgba(83a4e7ff)",
            inactive_border = "rgba(1e1e2eff)",
        },
        resize_on_border = false,
        allow_tearing    = false,

---- LAYOUT ----
        layout           = "dwindle",
    },
    dwindle = {
        preserve_split = true,
    },
    scrolling = {
        fullscreen_on_one_column = false,
        focus_fit_method = 0,  --0 for centered, 1 for normal
        column_width = 0.5,
        explicit_column_widths = "0.5,0.7,1.0"
    },

---- INPUT ----
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = -0.75, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },

---- MISC ----
    ecosystem = {
        enforce_permissions = false,
        no_donation_nag     = true,
        no_update_news      = false,
        },
    misc = {
        force_default_wallpaper  = 1,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        vrr = 0,
        },

---- ANIMATIONS ----
        animations = {
            enabled = true,
        },
})
-- Spring Curves
hl.curve("fast", { type = "spring", mass = 1, stiffness = 150, dampening = 22.5 })
hl.curve("slow", { type = "spring", mass = 1, stiffness = 90,  dampening = 18 })
-- Window animations
hl.animation({ leaf = "windows",          enabled = true, speed = 1, spring = "fast" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 1, spring = "fast", style = "popin" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1, spring = "fast", style = "popin" })
-- Border animations
hl.animation({ leaf = "border",           enabled = true, speed = 1, spring = "slow" })
hl.animation({ leaf = "borderangle",      enabled = false })
-- Fade
hl.animation({ leaf = "fade",             enabled = false })
hl.animation({ leaf = "fadeOut",	      enabled = true, speed = 1, spring = "slow" })
hl.animation({ leaf = "fadeIn", 	      enabled = false })
-- Zoom cursor
hl.animation({ leaf = "zoomFactor",       enabled = true, speed = 6, spring = "fast" })
-- Layer animations
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3, spring = "fast", style = "popin" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 3, spring = "fast", style = "popin" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2, spring = "fast" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 2, spring = "fast" })
-- Workspace animations
hl.animation({ leaf = "workspaces",       enabled = true, speed = 1, spring = "fast", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, spring = "slow", style = "slidevert 80%" })

---- PROGRAMS ----
local terminal = "kitty"
local file     = "kitty yazi"
local guifile  = "dolphin"
local browser  = "librewolf"
local music    = "strawberry"
local editor   = "kwrite"
local ipc      = "noctalia msg"
local stats    = "missioncenter"
local calc     = "kalk"
local mainMod  = "SUPER"

---- KEYBINDINGS ----
--hl.bind(mainMod .. " + M",                  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
local closeWindowBind =                       hl.bind(mainMod .. " + Q", hl.dsp.window.close())
--closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + B",                    hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",                    hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",                    hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + V",                    hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + F",                    hl.dsp.window.fullscreen())
--Programs
hl.bind(mainMod .. " + T",                    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D",                    hl.dsp.exec_cmd(file))
hl.bind(mainMod .. " + A",                    hl.dsp.exec_cmd(guifile))
hl.bind(mainMod .. " + W",                    hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + R",                    hl.dsp.exec_cmd(music))
hl.bind(mainMod .. " + E",                    hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + K",                    hl.dsp.exec_cmd(calc))
hl.bind("CTRL"  .. " + ALT +" .. " + DELETE", hl.dsp.exec_cmd(stats))
--Noctalia Binds
hl.bind(mainMod .. " + SPACE",                hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. " + F1",                   hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. " + F2",                   hl.dsp.exec_cmd(ipc .. " settings-toggle"))
hl.bind(mainMod .. " + L",                    hl.dsp.exec_cmd(ipc .. " session lock"))
hl.bind(mainMod .. " + ESCAPE",               hl.dsp.exec_cmd(ipc .. " panel-toggle session"))
hl.bind(mainMod .. " + F3",                   hl.dsp.exec_cmd(ipc .. " panel-toggle wallpaper"))
hl.bind(mainMod .. " + F4",                   hl.dsp.exec_cmd(ipc .. " wallpaper-random"))
hl.bind(mainMod .. " + M",                    hl.dsp.exec_cmd(ipc .. " screenshot-fullscreen"))
hl.bind(mainMod .. " + SHIFT + " .."M",       hl.dsp.exec_cmd(ipc .. " screenshot-region"))
--Noctalia Monitor On/Off
hl.bind(mainMod .. " + I",                    hl.dsp.exec_cmd(ipc .. " dpms-on"))
hl.bind(mainMod .. " + O",                    hl.dsp.exec_cmd(ipc .. " dpms-off"))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",                 hl.dsp.focus({ direction = "left" }), { repeating = true})
hl.bind(mainMod .. " + right",                hl.dsp.focus({ direction = "right" }), { repeating = true})
hl.bind(mainMod .. " + up",                   hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",                 hl.dsp.focus({ direction = "down" }))
-- Switch workspaces with mainmMod + 1-5
hl.bind(mainMod .. " + 1",                    hl.dsp.focus({ workspace = "edit"}))
hl.bind(mainMod .. " + 2",                    hl.dsp.focus({ workspace = "games"}))
hl.bind(mainMod .. " + 3",                    hl.dsp.focus({ workspace = "music"}))
hl.bind(mainMod .. " + 4",                    hl.dsp.focus({ workspace = "web"}))
-- Scroll through existing workspaces with mainMod + scroll or ALT + TAB
hl.bind(mainMod .. " + mouse_down",           hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",             hl.dsp.focus({ workspace = "e-1" }))
hl.bind("ALT"   .. " + TAB",	              hl.dsp.focus({ workspace = "e+1" }), { repeating = true})
--Special Workspace
hl.bind(mainMod .. " + S",                    hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + C",                    hl.dsp.window.move({ workspace = "special:scratchpad" }))
-- Move active window to other workspace
hl.bind(mainMod .. "+ SHIFT + " .. "1",       hl.dsp.window.move({ workspace = "edit"}))
hl.bind(mainMod .. "+ SHIFT + " .. "2",       hl.dsp.window.move({ workspace = "games"}))
hl.bind(mainMod .. "+ SHIFT + " .. "3",       hl.dsp.window.move({ workspace = "music"}))
hl.bind(mainMod .. "+ SHIFT + " .. "4",       hl.dsp.window.move({ workspace = "web"}))
-- Move active window within active workspace
hl.bind(mainMod .. " + SHIFT + " .. "left",   hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + " .. "right",  hl.dsp.window.move({ direction = "right"}))
hl.bind(mainMod .. " + SHIFT + " .. "up",     hl.dsp.window.move({ direction = "up"}))
hl.bind(mainMod .. " + SHIFT + " .. "down",   hl.dsp.window.move({ direction = "down"}))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272",            hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",            hl.dsp.window.resize(), { mouse = true })
--Media
hl.bind("CTRL" .. " + SHIFT +" .. "up",       hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("CTRL" .. " + SHIFT +" .. "down",     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("CTRL" .. " + SHIFT +" .. "right",    hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("CTRL" .. " + SHIFT +" .. "left",     hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("CTRL" .. " + SHIFT +" .. "SPACE",    hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

--Change layout of current workspace
hl.bind("SUPER + N", function ()
local layouts   = { "scrolling", "dwindle" }
local workspace = hl.get_active_workspace()
if hl.get_active_special_workspace() then
    workspace = hl.get_active_special_workspace()
    end
    local next_layout = "dwindle"
    if not workspace then
        return
        end
        for i = 1, #layouts do
            if layouts[i] == workspace.tiled_layout then
                local next_layout_idx = (i % #layouts) + 1
                next_layout = layouts[next_layout_idx]
                break
                end
                end
                if workspace.name then
                    hl.workspace_rule({ workspace = tostring("name:" .. workspace.name), layout = next_layout })
                    else
                        hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
                        end
                        end)

--Game Mode/Toggle Animations
hl.bind("SUPER + G", function ()
local game_mode = (hl.get_config("animations.enabled") == false)
if game_mode then
    hl.exec_cmd("hyprctl reload")
    return
    end
    hl.config({
        general = {
            gaps_in     = 0,
            gaps_out    = 0,
            border_size = 0,
        },
        animations = {
            enabled = false,
        },
        decoration = {
            shadow   = { enabled = false },
            blur     = { enabled = false },
            rounding = 0,
            active_opacity   = 1.0,
            inactive_opacity = 1.0,
        }
    })
    end)

--Toggle Opacity
hl.bind("SUPER + U", function ()
local current_opacity = hl.get_config("decoration.active_opacity")

if current_opacity == 1.0 then
    -- Set to transparent
    hl.config({
        decoration = {
            active_opacity   = 0.9,
            inactive_opacity = 0.9,
        }
    })
    else
        -- Set to opaque
        hl.config({
            decoration = {
                active_opacity   = 1.0,
                inactive_opacity = 1.0,
            }
        })
        end
        end)

--Toggle Blur
hl.bind("SUPER + Y", function ()
local current_blur = hl.get_config("decoration.blur.enabled")

if current_blur == true then
    -- Turn off Blur
    hl.config({
        decoration = {
            blur = {
                enabled = false,
                }
            }
        })
    else
    -- Turn on Blur
    hl.config({
        decoration = {
            blur = {
                enabled = true,
                }
            }
        })
        end
        end)

---- WINDOW RULES ----
hl.window_rule({ match = { class = "librewolf" },             opacity = "1 override", scrolling_width = 0.7})
hl.window_rule({ match = { class = "gimp" },                  opacity = "1 override", scrolling_width = 1})
hl.window_rule({ match = { class = "org.shotcut.Shotcut" },   opacity = "1 override", scrolling_width = 1})
hl.window_rule({ match = { class = "com.obsproject.Studio" }, opacity = "1 override", scrolling_width = 1})
hl.window_rule({ match = { class = "feh" },                   opacity = "1 override"})
hl.window_rule({ match = { class = "org.kde.kalk" },          float = true})
hl.window_rule({ match = { class = "desmume" },               opacity = "1 override"})
--hl.window_rule({ match = { class = "kitty" },                 float = true, size = {1000, 600}})

--xwayland fix
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

---- WORKSPACE RULES ----
hl.workspace_rule({ workspace = "name:web",   persistent = true })
hl.workspace_rule({ workspace = "name:music", persistent = true })
hl.workspace_rule({ workspace = "name:games", persistent = true })
hl.workspace_rule({ workspace = "name:edit",  persistent = true })

---- LAYER RULES ----
hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = false,
    blur_popups = false,
})
