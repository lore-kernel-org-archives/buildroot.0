From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 16 Feb 2014 14:27:49 +0100
Subject: [Buildroot] [PATCH v6 0/4] Introducing XBMC
Message-ID: <1392557273-3522-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new series, with some changes in the XBMC patch itself.
Thanks to Martin Bark and Yann E. Morin for spotting my errors.

Maxime Hadjinlian (4):
  sdl: add host version
  sdl_image: add host version
  dependencies.sh: Introduce BR2_HOST_NEEDS_JAVA
  xbmc: new package

 package/Config.in                                  |   1 +
 package/sdl/sdl.mk                                 |   2 +
 package/sdl_image/sdl_image.mk                     |  11 ++
 package/xbmc/Config.in                             | 166 ++++++++++++++++++++
 package/xbmc/S50xbmc                               |  41 +++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++++
 .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167 +++++++++++++++++++++
 package/xbmc/xbmc.mk                               | 149 ++++++++++++++++++
 package/xbmc/xbmc.service                          |  12 ++
 support/dependencies/dependencies.sh               |   8 +
 10 files changed, 636 insertions(+)
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S50xbmc
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
 create mode 100644 package/xbmc/xbmc.mk
 create mode 100644 package/xbmc/xbmc.service

--
1.8.5.3
