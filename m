From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Feb 2019 20:26:13 +0100
Subject: [Buildroot] [PATCH/next 6/6] package/flashrom: remove x86 dependency
In-Reply-To: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
References: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
Message-ID: <20190228192613.30160-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index f787bb3b62..948c774133 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
-	depends on BR2_i386 || BR2_x86_64
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
-- 
2.14.1
