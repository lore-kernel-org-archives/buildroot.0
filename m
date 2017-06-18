From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 16:40:57 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.6.18
Message-ID: <20170618144701.8486E7FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0309a6a7283a9a98205d2b9e34ec787953430346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.hash | 12 ++++++------
 package/freeswitch/freeswitch.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 2bd7a8d..371a55d 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,6 +1,6 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.17.tar.xz.md5
-md5 b50939fe562c66ca799f7a7f0e341488  freeswitch-1.6.17.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.17.tar.xz.sha1
-sha1 feda8e9334410bee1e5ae4d959a0982cf18c5bee  freeswitch-1.6.17.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.17.tar.xz.sha256
-sha256 709b3e43362d86b9682a7db14eb344b74362493d68244dfc4e6f40218089d4e1  freeswitch-1.6.17.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.18.tar.xz.md5
+md5 f3d38422270cc3f2f6ba7a68e074a38b  freeswitch-1.6.18.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.18.tar.xz.sha1
+sha1 36282dfbea11a603a17feb39070f4a63c5e7a380  freeswitch-1.6.18.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.18.tar.xz.sha256
+sha256 ac1b32f61e5c35680c5a2d6f145bc480cf26e6527af07d8b8b9fa2d5280252cd  freeswitch-1.6.18.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e6c1e8c..463a301 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.17
+FREESWITCH_VERSION = 1.6.18
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPL-1.1, \
