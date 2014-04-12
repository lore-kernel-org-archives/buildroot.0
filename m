From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 23:17:35 +0200
Subject: [Buildroot] [git commit] libatomic_ops: mark as supporting aarch64
Message-ID: <20140412211803.64CDF9C742@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=515527a9bdb55525c349f76355622270bf490956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix typo in the patch: BR2_aarch64 -> BR2_aarch64.]

Signed-off-by: Alex Benn??e <alex.bennee@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 3d5d0a8..0d05eea 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
 	help
 	  Atomic operations library
