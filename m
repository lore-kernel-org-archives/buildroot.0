From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:19:04 +0200
Subject: [Buildroot] [git commit] pixman: add explicit dependencies for host
	variant
Message-ID: <20160703072403.5748D81E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4044c95f7a78140ed50f13dc301fcc410ec64e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index ae8d62c..38524e6 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -12,6 +12,7 @@ PIXMAN_LICENSE_FILES = COPYING
 
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
+HOST_PIXMAN_DEPENDENCIES = host-pkgconf
 
 # For 0001-Disable-tests.patch
 PIXMAN_AUTORECONF = YES
