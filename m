From: Koen Martens <gmc@sonologic.nl>
Date: Sat, 17 Jun 2017 09:29:21 +0200
Subject: [Buildroot] [PATCH 0/1] linuxconsoletools package
Message-ID: <201706170839.v5H8ddr3021092@mx1.sonologic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have added the linuxconsoletools package. When running
test-pkg on it, toolchain config br-arcle-hs38 failed
because SDL was unable to build with this toolchain. I 
have no reason to believe that the linuxconsoletools
package will not build on that toolchain, but fixing
the sdl package seemed beyond the scope of this
package.

Koen Martens (1):
  linuxconsoletools: new package

 DEVELOPERS                                         |   3 +
 package/Config.in                                  |   1 +
 .../linuxconsoletools/0001-conditional-build.patch | 107 +++++++++++++++++++++
 package/linuxconsoletools/0002-sdl-config.patch    |  20 ++++
 package/linuxconsoletools/Config.in                |  43 +++++++++
 package/linuxconsoletools/linuxconsoletools.hash   |   2 +
 package/linuxconsoletools/linuxconsoletools.mk     |  52 ++++++++++
 7 files changed, 228 insertions(+)
 create mode 100644 package/linuxconsoletools/0001-conditional-build.patch
 create mode 100644 package/linuxconsoletools/0002-sdl-config.patch
 create mode 100644 package/linuxconsoletools/Config.in
 create mode 100644 package/linuxconsoletools/linuxconsoletools.hash
 create mode 100644 package/linuxconsoletools/linuxconsoletools.mk

-- 
2.7.4
