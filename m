From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:20:15 +0200
Subject: [Buildroot] [git commit] package/pptp-linux: bump version to 1.9.0
Message-ID: <20170922161618.AB46E800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82befadb3f49f686f26e8fe067902d5b2613aefb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated patch status of patch 0003.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch | 4 ++--
 package/pptp-linux/pptp-linux.hash                         | 6 +++---
 package/pptp-linux/pptp-linux.mk                           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch b/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
index d6b5445..1036b3c 100644
--- a/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
+++ b/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
@@ -7,8 +7,8 @@ We're using u_int32_t here, this breaks on musl libc builds otherwise.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
-Patch status: sent upstream to the devel mailing list
-(moderated, no archive link yet)
+Patch status: applied upstream:
+https://sourceforge.net/p/pptpclient/git/ci/ee8ef349d9543cb48045a27d1cdd801fc6e910e8/
 
  pqueue.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/package/pptp-linux/pptp-linux.hash b/package/pptp-linux/pptp-linux.hash
index 839d0bf..6200ef1 100644
--- a/package/pptp-linux/pptp-linux.hash
+++ b/package/pptp-linux/pptp-linux.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.8.0/
-md5	4efce9f263e2c3f38d79d9df222476de	pptp-1.8.0.tar.gz
-sha1	6289953812ac986c7234e83aefb10b5e279dc613	pptp-1.8.0.tar.gz
+# From http://sourceforge.net/projects/pptpclient/files/pptp/pptp-1.9.0/
+md5 b2117b377f65294a9786f80f0235d308  pptp-1.9.0.tar.gz
+sha1 047bb9812be477b44c94ffb1dc95c34658eedc24  pptp-1.9.0.tar.gz
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 17433b0..25f3037 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPTP_LINUX_VERSION = 1.8.0
+PPTP_LINUX_VERSION = 1.9.0
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
