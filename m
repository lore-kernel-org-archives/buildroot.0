From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 10 Jan 2015 14:47:24 +0100
Subject: [Buildroot] [PATCH v2 5/8] docs/manual/make-tips.mk: Add uboot
	documentation
In-Reply-To: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420897647-25001-6-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on the Barebox documentation text.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - None
---
 docs/manual/make-tips.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 027eddf..952a91a 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -28,6 +28,8 @@ some settings in the +.config+ file may hide some targets:
   selected in the internal toolchain backend;
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
+* +uboot-menuconfig+ and +uboot-savedefconfig+ only work when the
+  +uboot+ bootloader is enabled.
 
 .Cleaning:
 
-- 
2.2.1
