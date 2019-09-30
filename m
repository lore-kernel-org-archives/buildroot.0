From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:34:46 +0200
Subject: [Buildroot] [git commit] linux: fix indentation
Message-ID: <20190930192936.8026683930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fe310e8d9a7dd65ad1ba41cf6f8c14d5faf1d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 $: ./utils/check-package linux/*
 linux/linux.mk:528: expected indent with tabs
 1318 lines processed
 1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b9e72107df..89ac31c2e1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -525,7 +525,7 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
 
 # Import linux-kernel-extensions from br2-externals
 include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
-       $(ext)/linux/linux-ext-*.mk)))
+	$(ext)/linux/linux-ext-*.mk)))
 
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
