import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, aerospace} from "./utils";

// run "yarn run build" to generate karabiner.json

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },
  ...createHyperSubLayers({
    // b = "B"rowse
    b: {
      // Quarterly "P"lan
      r: open("https://reddit.com"),
      y: open("https://youtube.com"),
      m: open("https://moodle.uni-ulm.de/my/"),
      s: open("https://sogo.uni-ulm.de/SOGo/so/esy74/Mail/view#!/Mail/0/INBOX"),
      c: open("https://chatgpt.com/?model=auto")
    },
    // o = "Open" applications
    o: {
      1: app("Bitwarden"),

      p: app("Visual Studio Code"),
      m: app("Mail"),
      g: app("Zen"),
      d: app("Discord"),
      n: app("Obsidian"),
      t: app("Kitty"),
      // "M"arkdown (Reflect.app)
      f: app("Finder"),
      // "i"Message
      i: app("Beeper Desktop"),
      s: app("Spotify"),

      c: app("Claude")
    },

    // w = "Window"
    w: {
      semicolon: aerospace("layout floating tiling"),
      equal_sign: aerospace("resize smart +50"),
      hyphen: aerospace("resize smart -50"),

      z: aerospace("move-node-to-monitor --wrap-around --focus-follows-window prev"),
      o: aerospace("move-node-to-monitor --wrap-around --focus-follows-window next"),
      h: aerospace("focus left"),
      j: aerospace("focus down"),
      k: aerospace("focus up"),
      l: aerospace("focus right"),
      left_arrow: aerospace("move left"),
      down_arrow: aerospace("move down"),
      up_arrow: aerospace("move up"),
      right_arrow: aerospace("move right"),
      f: aerospace("fullscreen"),
      g: aerospace("macos-native-fullscreen"),
      r: aerospace("mode resize"),
      quote: aerospace("reload-config"),
      u: {
        description: "Window: Previous Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control", "right_shift"],
          },
        ],
      },
      i: {
        description: "Window: Next Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control"],
          },
        ],
      },
      m: {
        description: "Window: Next Window",
        to: [
          {
            key_code: "grave_accent_and_tilde",
            modifiers: ["right_control"],
          },
        ],
      },
      b: {
        description: "Window: Back",
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
      // Note: No literal connection. Both f and n are already taken.
      n: {
        description: "Window: Forward",
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
    },

    // s = "System"
    s: {
      u: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      l: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_control", "right_command"],
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      semicolon: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
      // "T"heme
      t: {
        description: "Toggle system appearance (dark/light)",
        to: [
          {
            shell_command: `osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'`,
          },
        ],
      },
      c: app("Photo Booth"),
      // 'v'oice
      v: {
        to: [
          {
            key_code: "spacebar",
            modifiers: ["left_option"],
          },
        ],
      },
    },

    // v = "moVe" which isn't "m" because we want it to be on the left hand
    // so that hjkl work like they do in vim
    v: {
      h: {
        to: [{ key_code: "left_arrow" }],
      },
      j: {
        to: [{ key_code: "down_arrow" }],
      },
      k: {
        to: [{ key_code: "up_arrow" }],
      },
      l: {
        to: [{ key_code: "right_arrow" }],
      },
      // Magicmove via homerow.app
      m: {
        to: [{ key_code: "f", modifiers: ["right_control"] }],
        // TODO: Trigger Vim Easymotion when VSCode is focused
      },
      // Scroll mode via homerow.app
      s: {
        to: [{ key_code: "j", modifiers: ["right_control"] }],
      },
      d: {
        to: [{ key_code: "d", modifiers: ["right_shift", "right_command"] }],
      },
      u: {
        to: [{ key_code: "page_down" }],
      },
      i: {
        to: [{ key_code: "page_up" }],
      },
    },

    // c = Musi*c* which isn't "m" because we want it to be on the left hand
    c: {
      p: {
        to: [{ key_code: "play_or_pause" }],
      },
      n: {
        to: [{ key_code: "fastforward" }],
      },
      b: {
        to: [{ key_code: "rewind" }],
      },
    },

  }),
  {
    description: "Change Backspace to Spacebar when Minecraft is focused",
    manipulators: [
      {
        type: "basic",
        from: {
          key_code: "delete_or_backspace",
        },
        to: [
          {
            key_code: "spacebar",
          },
        ],
        conditions: [
          {
            type: "frontmost_application_if",
            file_paths: [
              "^/Users/leonard/Library/Application Support/minecraft/runtime/java-runtime-gamma/mac-os-arm64/java-runtime-gamma/jre.bundle/Contents/Home/bin/java$",
            ],
          },
        ],
      },
    ],
  },
];

const devices = [
  {
    identifiers: {
      is_keyboard: true,
      product_id: 361,
      vendor_id: 9494,
    },
    ignore: true,
  },
  {
    identifiers: {
      device_address: "f9-eb-44-74-e7-e5",
      is_keyboard: true,
      is_pointing_device: true,
    },
    ignore: false,
  },
];

const virtualHidKeyboard = {
  keyboard_type_v2: "ansi",
};


fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
          devices,
          virtual_hid_keyboard: virtualHidKeyboard,
        },
      ],
    },
    null,
    2
  )
);
