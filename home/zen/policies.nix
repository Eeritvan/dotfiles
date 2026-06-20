let
  mkLockedAttrs = builtins.mapAttrs (
    _: value: {
      Value = value;
      Status = "locked";
    }
  );

  mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

  mkExtensionEntry =
    {
      id,
      pinned ? false,
    }:
    let
      base = {
        install_url = mkPluginUrl id;
        installation_mode = "force_installed";
      };
    in
    if pinned then base // { default_area = "navbar"; } else base;

  mkExtensionSettings = builtins.mapAttrs (
    _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
  );
in
{
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  DisableAppUpdate = true;
  DisableFeedbackCommands = true;
  DisableFirefoxStudies = true;
  DisablePocket = true;
  DisableTelemetry = true;
  NoDefaultBookmarks = true;
  OfferToSaveLogins = false;
  HardwareAcceleration = false;
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };

  SanitizeOnShutdown = {
    FormData = true;
    Cache = true;
  };

  ExtensionSettings = mkExtensionSettings {
    "uBlock0@raymondhill.net" = mkExtensionEntry {
      id = "ublock-origin";
      pinned = false;
    };

    "78272b6fa58f4a1abaac99321d503a20@proton.me" = mkExtensionEntry {
      id = "proton-pass";
      pinned = true;
    };

    "@react-devtools" = mkExtensionEntry {
      id = "react-devtools";
      pinned = false;
    };
  };

  Preferences = mkLockedAttrs {
    "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;

    "privacy.resistFingerprinting" = true;
    "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
    "privacy.resistFingerprinting.block_mozAddonManager" = true;
    "privacy.spoof_english" = 1;

    "privacy.firstparty.isolate" = true;
    "network.cookie.cookieBehavior" = 5;
    "dom.battery.enabled" = false;

    "gfx.webrender.all" = true;
    "network.http.http3.enabled" = true;
    "network.socket.ip_addr_any.disabled" = true; # disallow bind to 0.0.0.0
  };
}
