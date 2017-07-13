From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Jul 2017 22:00:01 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.6.19
Message-ID: <20170713201012.A8B088213C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29f956d99c3b3b8a90258a88d79b6c76e724b714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash | 12 ++++++------
 package/freeswitch/freeswitch.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 371a55d..ccda477 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,6 +1,6 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.18.tar.xz.md5
-md5 f3d38422270cc3f2f6ba7a68e074a38b  freeswitch-1.6.18.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.18.tar.xz.sha1
-sha1 36282dfbea11a603a17feb39070f4a63c5e7a380  freeswitch-1.6.18.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.18.tar.xz.sha256
-sha256 ac1b32f61e5c35680c5a2d6f145bc480cf26e6527af07d8b8b9fa2d5280252cd  freeswitch-1.6.18.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.19.tar.xz.md5
+md5 24b8ee769031ca152b76e6c17edd882b  freeswitch-1.6.19.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.19.tar.xz.sha1
+sha1 2a48f1f5ca0b24854f93e49a4728f79517a95a24  freeswitch-1.6.19.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.19.tar.xz.sha256
+sha256 e8d271a0d876ba4cca551682af0a4f5047bfd79438fcebdcc17d00711c04a8ff  freeswitch-1.6.19.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 463a301..e5c8854 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.18
+FREESWITCH_VERSION = 1.6.19
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPL-1.1, \
