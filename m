From: Richard Braun <rbraun@sceen.net>
Date: Thu, 20 Dec 2012 14:41:52 +0100
Subject: [Buildroot] [PATCH] arch: fix BR2_ARCH for generic target variant
Message-ID: <1356010912-3577-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 arch/Config.in.x86 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index d2e0807..ce30605 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -173,6 +173,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_athlon
 	default "i686"		if BR2_x86_athlon_4
 	default "x86_64"	if BR2_x86_64
+	default "i386"		if BR2_x86_generic
 
 config BR2_ENDIAN
 	default "LITTLE"
-- 
1.7.2.5
