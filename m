From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Oct 2016 22:29:16 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.6.12
Message-ID: <20161012203923.5130081F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fff5039b3a58d86e42d884172259dfeef79a1a76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 9d23174..5b888f5 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.11.tar.xz.sha256
-sha256 653aa8aa1ad012828e0b3d3441d4d2463dbeee0126b751006055c07417127b6e  freeswitch-1.6.11.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.12.tar.xz.sha256
+sha256 ae072ca2d96fd9ef59ca6f589f932048b088c7b469d46e468bb917371de24ff9  freeswitch-1.6.12.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index ce30d17..12b0913 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.11
+FREESWITCH_VERSION = 1.6.12
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
