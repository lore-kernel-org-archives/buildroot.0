From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:11:33 +0100
Subject: [Buildroot] [git commit] package/libseccomp: bump version to 2.2.3
Message-ID: <20160201224709.F1E517F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a57adb237a3d629a93d9b57bdceee72a33b6559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libseccomp/libseccomp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index a188298..69559f7 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.2.0
+LIBSECCOMP_VERSION = v2.2.3
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPLv2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
