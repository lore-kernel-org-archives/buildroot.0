From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:50:25 +0100
Subject: [Buildroot] [git commit] package/ttyd: bump to version 1.6.2
Message-ID: <20201221093424.D706B8149E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b6a0ab3c21321c2cfd8bd1ed5467cbd527f51e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index 8810282618..8448c978a4 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d72dcca3dec00cda87b80a0a25ae4fee2f8b9098c1cdb558508dcb14fbb6fafc  ttyd-1.6.1.tar.gz
+sha256  fd3256099e1cc5c470220cbfbb3ab2c7fa1f92232c503f583556a8965aa83bac  ttyd-1.6.2.tar.gz
 sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index 91b650c49e..9c456d16cd 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.6.1
+TTYD_VERSION = 1.6.2
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
