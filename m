From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:20 +0200
Subject: [Buildroot] [PATCH 24/34] grub2: really disable liblzma
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-24-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 88a46f4..112a401 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -62,7 +62,7 @@ GRUB2_CONF_OPTS = \
 	--with-platform=$(GRUB2_PLATFORM) \
 	--disable-grub-mkfont \
 	--enable-efiemu=no \
-	--enable-liblzma=no \
+	ac_cv_lib_lzma_lzma_code=no \
 	--enable-device-mapper=no \
 	--enable-libzfs=no \
 	--disable-werror
-- 
2.7.4
