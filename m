From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Nov 2019 21:14:01 +0100
Subject: [Buildroot] [PATCH v7 00/18] package/kodi: bump to version 18.4-Leia
Message-ID: <20191104201419.2757-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

v7: - bumped to Leia HEAD
    - rebased
    - switched most addons to version based on current tag from Leia
      branch instead of using a hash-based version number
v6: - bumped kodi to 18.4-Leia
    - bumped several kodi packages to latest Leia HEAD
v5: - bumped several kodi packages to latest Leia HEAD
    - removed big kodi-screensaver-rsxs patch

Bernd Kuhls (18):
  package/kodi-platform: bump version
  package/kodi: bump to version 18.4-Leia
  package/kodi-audiodecoder-*: mass version bump
  package/kodi-audioencoder-*: mass version bump
  package/kodi-inputstream-adaptive: bump version
  package/kodi-inputstream-rtmp: bump version
  package/kodi-peripheral-joystick: bump version
  package/kodi-peripheral-*: mass version bump
  package/kodi-pvr-iptvsimple: bump version
  package/kodi-pvr-mediaportal-tvserver: bump version
  package/kodi-pvr-stalker: bump version
  package/kodi-pvr-vuplus: bump version
  package/kodi-pvr-*: mass version bump
  package/kodi-screensaver-asteroids: bump version
  package/kodi-screensaver-rsxs: bump version
  package/kodi-screensaver-*: mass version bump
  package/kodi-skin-confluence: bump version
  package/kodi-visualisation-*: mass version bump

 package/kodi-audiodecoder-modplug/Config.in   |   3 +-
 .../kodi-audiodecoder-modplug.hash            |   2 +-
 .../kodi-audiodecoder-modplug.mk              |   6 +-
 package/kodi-audiodecoder-nosefart/Config.in  |   3 +-
 .../kodi-audiodecoder-nosefart.hash           |   2 +-
 .../kodi-audiodecoder-nosefart.mk             |   6 +-
 package/kodi-audiodecoder-sidplay/Config.in   |   3 +-
 .../kodi-audiodecoder-sidplay.hash            |   2 +-
 .../kodi-audiodecoder-sidplay.mk              |   6 +-
 package/kodi-audiodecoder-snesapu/Config.in   |   3 +-
 .../kodi-audiodecoder-snesapu.hash            |   2 +-
 .../kodi-audiodecoder-snesapu.mk              |   6 +-
 package/kodi-audiodecoder-stsound/Config.in   |   3 +-
 .../kodi-audiodecoder-stsound.hash            |   2 +-
 .../kodi-audiodecoder-stsound.mk              |   6 +-
 package/kodi-audiodecoder-timidity/Config.in  |   2 +-
 .../kodi-audiodecoder-timidity.hash           |   2 +-
 .../kodi-audiodecoder-timidity.mk             |   4 +-
 package/kodi-audiodecoder-vgmstream/Config.in |   3 +-
 .../kodi-audiodecoder-vgmstream.hash          |   2 +-
 .../kodi-audiodecoder-vgmstream.mk            |   6 +-
 .../kodi-audioencoder-flac.hash               |   2 +-
 .../kodi-audioencoder-flac.mk                 |   4 +-
 .../kodi-audioencoder-lame.hash               |   2 +-
 .../kodi-audioencoder-lame.mk                 |   4 +-
 .../kodi-audioencoder-vorbis.hash             |   2 +-
 .../kodi-audioencoder-vorbis.mk               |   2 +-
 .../kodi-audioencoder-wav.hash                |   2 +-
 .../kodi-audioencoder-wav.mk                  |   4 +-
 package/kodi-inputstream-adaptive/Config.in   |   2 -
 .../kodi-inputstream-adaptive.hash            |   2 +-
 .../kodi-inputstream-adaptive.mk              |   6 +-
 package/kodi-inputstream-rtmp/Config.in       |   2 +-
 .../kodi-inputstream-rtmp.hash                |   2 +-
 .../kodi-inputstream-rtmp.mk                  |   4 +-
 .../kodi-jsonschemabuilder.mk                 |   4 +-
 package/kodi-peripheral-joystick/Config.in    |   2 +-
 .../kodi-peripheral-joystick.hash             |   2 +-
 .../kodi-peripheral-joystick.mk               |   8 +-
 .../kodi-peripheral-steamcontroller.hash      |   2 +-
 .../kodi-peripheral-steamcontroller.mk        |   2 +-
 .../kodi-peripheral-xarcade.hash              |   2 +-
 .../kodi-peripheral-xarcade.mk                |   2 +-
 package/kodi-platform/kodi-platform.hash      |   2 +-
 package/kodi-platform/kodi-platform.mk        |   2 +-
 .../kodi-pvr-argustv/kodi-pvr-argustv.hash    |   2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk  |   4 +-
 .../kodi-pvr-dvblink/kodi-pvr-dvblink.hash    |   2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk  |   4 +-
 .../kodi-pvr-dvbviewer.hash                   |   2 +-
 .../kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk  |   4 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash  |   2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk    |   4 +-
 .../kodi-pvr-hdhomerun.hash                   |   2 +-
 .../kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk  |   4 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash        |   2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk          |   4 +-
 package/kodi-pvr-iptvsimple/Config.in         |   1 +
 .../kodi-pvr-iptvsimple.hash                  |   2 +-
 .../kodi-pvr-iptvsimple.mk                    |   6 +-
 ...e555-remove-xlocale.h-from-Locale.hh.patch |  33 ----
 .../kodi-pvr-mediaportal-tvserver.hash        |   2 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |   4 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash  |   2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk    |   4 +-
 .../kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash    |   2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk  |   4 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash      |   2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk        |   4 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash      |   2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk        |   4 +-
 .../0001-src-CWatchdog.h-Fix-gcc7-build.patch |  29 ---
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |   2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |   4 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash      |   2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk        |   4 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash  |   2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk    |   4 +-
 package/kodi-pvr-vuplus/Config.in             |   2 +
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash  |   2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk    |   6 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash        |   2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk          |   4 +-
 package/kodi-screensaver-asteroids/Config.in  |   3 +-
 .../kodi-screensaver-asteroids.hash           |   2 +-
 .../kodi-screensaver-asteroids.mk             |   6 +-
 package/kodi-screensaver-asterwave/Config.in  |   2 +-
 .../kodi-screensaver-asterwave.hash           |   2 +-
 .../kodi-screensaver-asterwave.mk             |   4 +-
 package/kodi-screensaver-biogenesis/Config.in |   2 +-
 .../kodi-screensaver-biogenesis.hash          |   2 +-
 .../kodi-screensaver-biogenesis.mk            |   4 +-
 package/kodi-screensaver-cpblobs/Config.in    |   2 +-
 .../kodi-screensaver-cpblobs.hash             |   2 +-
 .../kodi-screensaver-cpblobs.mk               |   4 +-
 .../kodi-screensaver-crystalmorph.hash        |   2 +-
 .../kodi-screensaver-crystalmorph.mk          |   2 +-
 package/kodi-screensaver-greynetic/Config.in  |   2 +-
 .../kodi-screensaver-greynetic.hash           |   2 +-
 .../kodi-screensaver-greynetic.mk             |   4 +-
 .../kodi-screensaver-matrixtrails/Config.in   |   2 +-
 .../kodi-screensaver-matrixtrails.hash        |   2 +-
 .../kodi-screensaver-matrixtrails.mk          |   5 +-
 package/kodi-screensaver-pingpong/Config.in   |   2 +-
 .../kodi-screensaver-pingpong.hash            |   2 +-
 .../kodi-screensaver-pingpong.mk              |   4 +-
 package/kodi-screensaver-pyro/Config.in       |   2 +-
 .../kodi-screensaver-pyro.hash                |   2 +-
 .../kodi-screensaver-pyro.mk                  |   4 +-
 .../0001-Disable-drempels.patch               |  40 +++++
 .../0001-cross-compile.patch                  |  37 ----
 .../0002-fix-default-include-dir.patch        |  28 ---
 package/kodi-screensaver-rsxs/Config.in       |  14 +-
 .../kodi-screensaver-rsxs.hash                |   2 +-
 .../kodi-screensaver-rsxs.mk                  |   7 +-
 package/kodi-screensaver-stars/Config.in      |   2 +-
 .../kodi-screensaver-stars.hash               |   2 +-
 .../kodi-screensaver-stars.mk                 |   4 +-
 .../kodi-skin-confluence.hash                 |   3 +-
 .../kodi-skin-confluence.mk                   |   4 +-
 ...-fix-texture-packer-cmake-source-dir.patch |  27 +++
 .../0002-fix_reallocarray.patch               | 170 ------------------
 .../kodi-texturepacker/kodi-texturepacker.mk  |   7 +-
 .../kodi-visualisation-fishbmc.hash           |   2 +-
 .../kodi-visualisation-fishbmc.mk             |   4 +-
 .../0001-cross-compile.patch                  |  32 ----
 .../0001-lib-goom2k4-0-fix-static-build.patch |  32 ++++
 .../kodi-visualisation-goom.hash              |   2 +-
 .../kodi-visualisation-goom.mk                |   4 +-
 ...-also-search-for-egl-with-pkg-config.patch |  44 -----
 .../kodi-visualisation-shadertoy.hash         |   2 +-
 .../kodi-visualisation-shadertoy.mk           |   4 +-
 .../kodi-visualisation-spectrum.hash          |   2 +-
 .../kodi-visualisation-spectrum.mk            |   4 +-
 .../kodi-visualisation-waveform.hash          |   2 +-
 .../kodi-visualisation-waveform.mk            |   4 +-
 ...e-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   8 +-
 ...endency-on-gmp-and-libintl-from-Find.patch |  39 ----
 ...h => 0002-Fix-crosscompiling-issues.patch} |  29 ++-
 ...cmake-iconv-is-a-required-dependency.patch |  92 ----------
 .../kodi/0004-Fix-ffmpeg-build-for-mips.patch |  43 -----
 package/kodi/Config.in                        |  24 +--
 package/kodi/kodi.hash                        |  12 +-
 package/kodi/kodi.mk                          |  82 ++++-----
 144 files changed, 336 insertions(+), 863 deletions(-)
 delete mode 100644 package/kodi-pvr-mediaportal-tvserver/0001-live555-remove-xlocale.h-from-Locale.hh.patch
 delete mode 100644 package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
 create mode 100644 package/kodi-screensaver-rsxs/0001-Disable-drempels.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0001-cross-compile.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0002-fix-default-include-dir.patch
 create mode 100644 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
 delete mode 100644 package/kodi-texturepacker/0002-fix_reallocarray.patch
 delete mode 100644 package/kodi-visualisation-goom/0001-cross-compile.patch
 create mode 100644 package/kodi-visualisation-goom/0001-lib-goom2k4-0-fix-static-build.patch
 delete mode 100644 package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
 delete mode 100644 package/kodi/0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
 rename package/kodi/{0005-Fix-crosscompiling-issues.patch => 0002-Fix-crosscompiling-issues.patch} (86%)
 delete mode 100644 package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
 delete mode 100644 package/kodi/0004-Fix-ffmpeg-build-for-mips.patch

-- 
2.20.1
