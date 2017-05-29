From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:37:32 +0200
Subject: [Buildroot] [git commit] package/xscreensaver: bump version to 5.36
Message-ID: <20170601202859.124CA818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbcbc55abb3fc8368f866ab71c28799caff9acc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xscreensaver/xscreensaver.hash | 2 +-
 package/xscreensaver/xscreensaver.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 7e7a07e..48bc2b1 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4252a6079d2d2f5b342e8bdd172cbad5f0af73daf4e412b61a68344d91ca93bd xscreensaver-5.32.tar.gz
+sha256 6b8b5238047f1613d99149bb02d5ed3384675f3ce74a0a8ba25290bd61abc06c  xscreensaver-5.36.tar.gz
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index a726bee..77c37a9 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 5.32
-XSCREENSAVER_SITE = http://www.jwz.org/xscreensaver
+XSCREENSAVER_VERSION = 5.36
+XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
