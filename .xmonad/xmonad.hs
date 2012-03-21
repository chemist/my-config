import XMonad

import XMonad.Actions.SpawnOn
import XMonad.Actions.GridSelect
import XMonad.Actions.DynamicWorkspaces

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.PerWorkspace
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile

import XMonad.Prompt
import XMonad.Prompt.Window
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Shell

import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.Cursor
import XMonad.Util.Scratchpad

import qualified XMonad.StackSet as W
import System.IO

myWorkspaces = ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ" ]
myManageHook = composeAll $ [
    className =? "Skype"           --> doFloat 
  , className =? "Skype"           --> doF (W.shift "ζ") 
  , className =? "pidgin"           --> doFloat
  , className =? "pidgin"           --> doF (W.shift "ζ") 
  , className =? "Pidgin"           --> doFloat
  , className =? "Pidgin"           --> doF (W.shift "ζ") 
  , className =? "zathura"           --> doF (W.shift "γ") 
  , className =? "Zathura"           --> doF (W.shift "γ") 
  , className =? "XCalc"           --> doFloat
  , className =? "xcalc"           --> doFloat
  , className =? "audacious"       --> doFloat
  , className =? "Audacious"       --> doFloat
  , className =? "gvim"       --> doFloat
  , className =? "Gvim"       --> doFloat
  , className =? "Dia"           --> doFloat
  , className =? "chromium"     --> doF (W.shift "β")
  , className =? "Chromium"     --> doF (W.shift "β")
  , className =? "Toplevel"       --> doFloat 
  , isFullscreen                 --> doFullFloat
  , scratchpadManageHook (W.RationalRect l t w h)
  ]
  where
    h = 0.56
    w = 0.61
    t = 1 - h
    l = (1 - w)/2

myLayout = tiled ||| onWorkspace "η" (ThreeCol 1 (1/100) (1/2)) Full ||| Mirror tiled
  
  where
    tiled   = ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio   = 1/2
    delta   = 1/100

gsconfig = defaultGSConfig {
  gs_cellheight = 25
  , gs_cellwidth = 200
  , gs_font = "xft:Liberation Mono:size=9"
  }

myXPConfig = defaultXPConfig {
  font = "xft:Liberation Mono:size=9"
  , position = Top
  }

myKeys = 
  [
  ((mod1Mask, xK_p), shellPrompt myXPConfig)
  , ((mod1Mask .|. shiftMask, xK_h), sendMessage MirrorExpand)
  , ((mod1Mask .|. shiftMask, xK_l), sendMessage MirrorShrink)
  , ((mod1Mask .|. shiftMask, xK_m), spawn "urxvt -e ncmpcpp")
  , ((mod4Mask,          xK_l     ), spawn "slock")
  , ((0, xK_Print), spawn "scrot")
  , ((mod1Mask, xK_c), spawn "mpc toggle")
  , ((mod1Mask, xK_b), sendMessage ToggleStruts)
  , ((mod1Mask, xK_g), windowPromptGoto myXPConfig)
  , ((mod1Mask .|. shiftMask, xK_g), goToSelected gsconfig)
  , ((controlMask, xK_grave), scratchpadSpawnActionCustom "urxvt -T scratchpad -name scratchpad -e screen -d -RR -S scpad")
  , ((mod1Mask,               xK_space ), sendMessage NextLayout)
  -- Move focus to the next window
  , ((mod1Mask,               xK_Tab   ), windows W.focusDown)
  -- Move focus to the next window
  , ((mod1Mask,               xK_j     ), windows W.focusDown)
  -- Move focus to the previous window
  , ((mod1Mask,               xK_k     ), windows W.focusUp  )
  -- Move focus to the master window
  , ((mod1Mask,               xK_m     ), windows W.focusMaster  )
  -- Swap the focused window and the master window
  , ((mod1Mask,               xK_Return), windows W.swapUp >> windows W.focusMaster)
  -- Swap the focused window with the next window
  , ((mod1Mask .|. shiftMask, xK_j     ), windows W.swapDown  )
  -- Swap the focused window with the previous window
  , ((mod1Mask .|. shiftMask, xK_k     ), windows W.swapUp    )
  -- Push window back into tiling
  , ((mod1Mask,               xK_t     ), withFocused $ windows . W.sink)
  ]
  ++
  [
    ((m .|. mod1Mask, k), windows $ f i)
       | (i, k) <- zip myWorkspaces ([xK_1..xK_9] ++ [xK_0])
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]
  
myLogHook xmproc = dynamicLogWithPP $ xmobarPP {
  ppOutput = hPutStrLn xmproc
  , ppCurrent = xmobarColor "lightblue" "#282828" . wrap "[" "]"
  , ppHiddenNoWindows = xmobarColor "#777777" "" . noScratchPad
  , ppHidden = noScratchPad
  , ppLayout = (\x -> case x of
                                "ResizableTall" -> "T"
                                "Mirror ResizableTall" -> "-"
                                "Full" -> "F")
  , ppTitle = const ""
  , ppSep = " | "
  }
  where
    noScratchPad ws = if ws == "NSP" then "" else ws
  
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/chemist/.xmonad/xmobarrc"
  xmonad $ ewmh defaultConfig {
    startupHook     = setDefaultCursor xC_left_ptr
    , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ smartBorders $ myLayout
    , modMask = mod1Mask       -- Rebind Mod to Windows key
    , terminal = "urxvt"
    , workspaces = myWorkspaces
    , normalBorderColor = "#D3D7CF"
    , focusedBorderColor = "#729FCF"
    , handleEventHook = ewmhDesktopsEventHook
    , logHook = myLogHook xmproc
    } `additionalKeys` myKeys

