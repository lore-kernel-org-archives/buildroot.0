From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:16 -0400
Subject: [Buildroot] [PATCH 05/10] netatalk: bump to version 3.1.9
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-6-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is compatible with LibreSSL.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/netatalk/netatalk.hash | 6 +++---
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 955ffd401..1b974f5b6 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.8/
-md5	9cab934ca32b8979f389da52d44c69c2	netatalk-3.1.8.tar.bz2
-sha1	00518461a311e6c17c95738ac214c8f06f863b4b	netatalk-3.1.8.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.9/
+md5	d1d385ae6c3dc45eef4c923472f8fa5f	netatalk-3.1.9.tar.bz2
+sha1	ac746efc00e8cfbe5042a7835b27480bb83505cd	netatalk-3.1.9.tar.bz2
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 5742eafd0..8baf6e5f4 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.8
+NETATALK_VERSION = 3.1.9
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
-- 
2.13.3
