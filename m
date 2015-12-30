From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 19:23:02 +0100
Subject: [Buildroot] [git commit] netatalk: bump to version 3.1.8
Message-ID: <20151230182311.5536382755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e65a856b99b677f21f89465541822763d37140ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/netatalk.hash | 6 +++---
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index e201ae6..955ffd4 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.7/
-md5	831ec8bf9e084b64f965d16c528af299	netatalk-3.1.7.tar.bz2
-sha1	d4077a9496beae766ab1e4f28afa22e5c96514f0	netatalk-3.1.7.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.8/
+md5	9cab934ca32b8979f389da52d44c69c2	netatalk-3.1.8.tar.bz2
+sha1	00518461a311e6c17c95738ac214c8f06f863b4b	netatalk-3.1.8.tar.bz2
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index a882b3c..dbe13a9 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.7
+NETATALK_VERSION = 3.1.8
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch
