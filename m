From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 Aug 2016 21:19:27 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/freeswitch: bump version to
	1.6.10
Message-ID: <20160825191927.27176-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 2041158..4a4d6da 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,2 +1,2 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.9.tar.xz.sha256
-sha256	aa5f191113be2bd44cb4f2108da3dcc37be3234c6b733896fbff97526ac66451	freeswitch-1.6.9.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.10.tar.xz.sha256
+sha256 b7beaaac29dc0a58cc34cfd402bf1c7e8ca06975722fd8ddb2983cbed17dd6e4  freeswitch-1.6.10.tar.xz
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e7e9ece..b65096b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.9
+FREESWITCH_VERSION = 1.6.10
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPLv1.1, \
-- 
2.9.3
