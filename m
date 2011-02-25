From: Will Newton <will.newton@gmail.com>
Date: Fri, 25 Feb 2011 17:46:23 +0000
Subject: [Buildroot] [PATCH 2/8] gnuconfig: Remove GNU Hurd patch as it is
	no longer supported.
Message-ID: <AANLkTinGbZWK6QKaxSWt6BepOGFAJgMchKbJhTTTPN8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 .../patches/config.sub.gnuhurd-uclibc.patch        |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch

diff --git a/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch
b/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch
deleted file mode 100644
index 6fcdf81..0000000
--- a/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: config.sub
-===================================================================
---- config.sub	(revision 20153)
-+++ config.sub	(working copy)
-@@ -121,6 +121,7 @@
- maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
- case $maybe_os in
-   nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
-+  gnu*-uclibc* | \
-   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* |
netbsd*-gnu* | \
-   storm-chaos* | os2-emx* | rtmk-nova*)
-     os=-$maybe_os
-@@ -1237,6 +1238,7 @@
- 	      | -chorusos* | -chorusrdb* \
- 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
- 	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
-+	      | -gnu*-uclibc* \
- 	      | -uxpv* | -beos* | -mpeix* | -udk* \
- 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
- 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
-- 
1.7.3.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-gnuconfig-Remove-GNU-Hurd-patch-as-it-is-no-longer-s.patch
Type: text/x-patch
Size: 1708 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110225/e12f3627/attachment.bin>
