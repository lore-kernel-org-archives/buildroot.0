From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 30 Aug 2016 16:21:59 -0500
Subject: [Buildroot] [PATCH] audit: add powerpc64 arch support
Message-ID: <1472592119-51029-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Judd Meinders <judd.meinders@rockwellcollins.com>

Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
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
-- 
1.9.1
