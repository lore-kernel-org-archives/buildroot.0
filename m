From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:54:24 +0200
Subject: [Buildroot] [git commit] audit: add powerpc64 arch support
Message-ID: <20160906195430.9500C81E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6c83d17beda67efffef52f8558f7367f3b32000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/audit/Config.in b/package/audit/Config.in
index df5a5cc..7550f3a 100644
--- a/package/audit/Config.in
+++ b/package/audit/Config.in
@@ -2,7 +2,8 @@
 config BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_arm || BR2_armeb || \
-		BR2_i386 || BR2_powerpc || BR2_x86_64
+		BR2_i386 || BR2_powerpc || BR2_powerpc64 || \
+		BR2_x86_64
 
 config BR2_PACKAGE_AUDIT
 	bool "audit"
