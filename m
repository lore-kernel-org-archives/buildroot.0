From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Mar 2011 23:31:27 +0100
Subject: [Buildroot] [git commit master 1/1] gnuconfig: Remove GNU Hurd
	patch as it is no longer supported.
Message-ID: <20110308062854.BFC5E88F01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9b4c7d88b61f70c07dae4dcb3864b17677b5a22e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../patches/config.sub.gnuhurd-uclibc.patch        |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch

diff --git a/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch b/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch
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
-   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
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
