From: Christophe Vu-Brugier <cvubrugier@lacie.com>
Date: Thu,  7 Mar 2013 11:21:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/mdadm: add license information
In-Reply-To: <1362651666-21225-1-git-send-email-cvubrugier@lacie.com>
References: <1362651666-21225-1-git-send-email-cvubrugier@lacie.com>
Message-ID: <1362651666-21225-2-git-send-email-cvubrugier@lacie.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
---
 package/mdadm/mdadm.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index d5d1766..e8cefda 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -7,6 +7,8 @@
 MDADM_VERSION = 3.2.6
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
+MDADM_LICENSE = GPLv2+
+MDADM_LICENSE_FILES = COPYING
 
 MDADM_MAKE_OPT = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
-- 
1.7.10.4
