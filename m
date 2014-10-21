From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:00 +0200
Subject: [Buildroot] [PATCH v2 13/30] speex: use BR2_ARM_CPU_ARM* options
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-14-git-send-email-thomas.petazzoni@free-electrons.com>
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
index ab743fe..f18e866 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_SPEEX
 config BR2_PACKAGE_SPEEX_ARM4
 	bool
 	default y
-	depends on BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526
+	depends on BR2_ARM_CPU_ARMV4
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
-- 
2.0.0
