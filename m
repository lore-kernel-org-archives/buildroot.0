From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 21:32:38 +0200
Subject: [Buildroot] [git commit] toolchain: copy_toolchain_lib_root: remove
	unused variable LIBDIR
Message-ID: <20170405195202.691FD804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eff1980194a26c85143ef775e270901704106832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 8367a06..319fbd4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -17,7 +17,6 @@ copy_toolchain_lib_root = \
 		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
-			LIBDIR=`dirname $${LIBPATH}` ; \
 			LINKTARGET=`readlink $${LIBPATH}` ; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
