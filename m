From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Nov 2017 17:53:14 +0100
Subject: [Buildroot] [git commit branch/next] python-numpy: remove trailing
 whitespace
Message-ID: <20171113221622.EE713807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9c562dfdac123e707dc8283338b11b24832ba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove trailing whitespace introduced by commit
855002f22b4795b7ff3e37880c3ed65011cd036c ("python-numpy: reformat
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-numpy/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 1405218..aa47087 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -4,14 +4,14 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# ARC toolchain issues for ARCompact
 	default y if BR2_arc && !(BR2_arc770d || BR2_arc750d)
 	default y if BR2_aarch64
-	default y if BR2_arm 
+	default y if BR2_arm
 	default y if BR2_armeb
-	default y if BR2_i386 
+	default y if BR2_i386
 	default y if BR2_mips
 	default y if BR2_mipsel
 	default y if BR2_powerpc
-	default y if BR2_powerpc64 
-	default y if BR2_sh 
+	default y if BR2_powerpc64
+	default y if BR2_sh
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_PYTHON_NUMPY
