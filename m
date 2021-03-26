From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:53:48 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-iptvsimple: bump version
 to 7.5.1-Matrix
Message-ID: <20210326223002.7F7668A268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47dfa562f0b3100718c3b78071bbc72da19ec111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/kodi-pvr/pvr.iptvsimple/blob/Matrix/pvr.iptvsimple/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index b136cef01b..9170da5bc0 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1cbe623e1eec0246c782398d8a8964d26b0fa68966c7f1422666068e50fb4e00  kodi-pvr-iptvsimple-7.5.0-Matrix.tar.gz
+sha256  df020ba77864111476c7ab637fa82d658c248723c64d5fd4a31443def60cd75a  kodi-pvr-iptvsimple-7.5.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 8251c53f8f..fa14e5677c 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 7.5.0-Matrix
+KODI_PVR_IPTVSIMPLE_VERSION = 7.5.1-Matrix
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
