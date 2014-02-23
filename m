From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:22:47 +0100
Subject: [Buildroot] [git commit] docs/manual: refresh informations about
	*-menuconfig targets
Message-ID: <20140223213139.56F0396E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d2071a2b789c11d2220cb6e1e5ed7451f50092b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/make-tips.txt |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 0159ffe..faf59f2 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -32,10 +32,12 @@ The result of the search shows the help message of the matching items.
 Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
 
+* +busybox-menuconfig+ and +busybox-savedefconfig+ ony work when
+  +busybox+ is enabled;
 * +linux-menuconfig+ and +linux-savedefconfig+ only work when
   +linux+ is enabled;
-* +uclibc-menuconfig+ is only available when the
-  Buildroot internal toolchain backend is used;
+* +uclibc-menuconfig+ is only available when the uClibc C library is
+  selected in the internal toolchain backend;
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
 
