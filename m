From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 18 Feb 2014 00:37:09 +0100
Subject: [Buildroot] [PATCH v7 0/4] Introducing XBMC
Message-ID: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here we go again with a new round.
Again most of the changes are located within the XBMC patch.

Maxime Hadjinlian (4):
  sdl: add host version
  sdl_image: add host version
  infra: Introduce BR2_HOST_NEEDS_JAVA
  xbmc: new package

 Config.in                                          |   5 +
 package/Config.in                                  |   1 +
 package/sdl/sdl.mk                                 |   4 +-
 package/sdl_image/sdl_image.mk                     |  11 ++
 package/xbmc/Config.in                             | 165 ++++++++++++++++++++
 package/xbmc/S50xbmc                               |  41 +++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch    |  81 ++++++++++
 .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 168 +++++++++++++++++++++
 package/xbmc/xbmc.mk                               | 149 ++++++++++++++++++
 package/xbmc/xbmc.service                          |  12 ++
 support/dependencies/dependencies.sh               |   8 +
 11 files changed, 644 insertions(+), 1 deletion(-)
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S50xbmc
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
 create mode 100644 package/xbmc/xbmc.mk
 create mode 100644 package/xbmc/xbmc.service

--
1.8.5.3
