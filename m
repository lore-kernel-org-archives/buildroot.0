From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 20:37:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pptp-linux: bump version to 1.9.0
Message-ID: <20170917183701.20859-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated patch status of patch 0003.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch | 4 ++--
 package/pptp-linux/pptp-linux.hash                         | 6 +++---
 package/pptp-linux/pptp-linux.mk                           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch b/package/pptp-linux/0003-pqueue.h-include-sys-types.h.patch
index d6b5445fa9..1036b3c895 100644
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
index 839d0bf84f..6200ef151f 100644
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
index 17433b03ad..25f3037f88 100644
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
-- 
2.11.0
