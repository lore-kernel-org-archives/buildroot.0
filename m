From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Oct 2016 10:00:09 +0200
Subject: [Buildroot] [git commit] package/freeswitch: bump to version 1.6.11
Message-ID: <20161001080051.71ACF81D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=914df2ed7234d09504f69d0d690ee9bd0de691ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 4a4d6da..9d23174 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.10.tar.xz.sha256
-sha256 b7beaaac29dc0a58cc34cfd402bf1c7e8ca06975722fd8ddb2983cbed17dd6e4  freeswitch-1.6.10.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.11.tar.xz.sha256
+sha256 653aa8aa1ad012828e0b3d3441d4d2463dbeee0126b751006055c07417127b6e  freeswitch-1.6.11.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index b65096b..ce30d17 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.10
+FREESWITCH_VERSION = 1.6.11
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
