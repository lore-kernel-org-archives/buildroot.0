From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:42 -0000
Subject: [Buildroot] [git commit] netatalk: bump to version 3.1.9
Message-ID: <20170902130615.7F7B880285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb7a53e5afa24077f3a8210d07a12f9ee9de9473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is compatible with LibreSSL.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netatalk/netatalk.hash | 6 +++---
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 955ffd4..1b974f5 100644
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
index 8e661a0..e0085db 100644
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
