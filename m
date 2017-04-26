From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:15 +0200
Subject: [Buildroot] [git commit] package/acsccid: bump version to 1.1.4
Message-ID: <20170426072113.542DF8280F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff75225568eea04a92e8cf5173be59635dc3e3dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acsccid/acsccid.hash | 6 +++---
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 1bfe9e4..24d2fa7 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.1/
-sha1 ae340256bbba36032a903c9f89883297a31ca340 acsccid-1.1.1.tar.bz2
-md5 26dc34141188e64fa2b3545032060357 acsccid-1.1.1.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.4/
+sha1 8c0b42ff79032289731916d18a2698b258dfd6a2 acsccid-1.1.4.tar.bz2
+md5 ac77b3aeae0a11723c96c7f98769490e acsccid-1.1.4.tar.bz2
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 2fd2033..06a0418 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.1
+ACSCCID_VERSION = 1.1.4
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
