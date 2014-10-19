From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:48 +0200
Subject: [Buildroot] [PATCH 14/31] speex: use BR2_ARM_CPU_ARM* options
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/speex/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index ab743fe..8836239 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_SPEEX
 config BR2_PACKAGE_SPEEX_ARM4
 	bool
 	default y
-	depends on BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526
+	depends on BR2_ARM_CPU_ARMV4 || BR2_ARM_CPU_ARMV4T
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
-- 
2.0.0
