From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] bdwgc: add explicit dependencies for host
	variant
Message-ID: <20160703064348.5BF9F7FE6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33875692e9d073a1f31369e0e3b9402feb3dee4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bdwgc/bdwgc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 4603151..0e9054d 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -11,6 +11,7 @@ BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
+HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
 
 # The libtool shipped with the package is bogus and generates some
 # -L/usr/lib flags. It uses a version not supported by Buildroot
