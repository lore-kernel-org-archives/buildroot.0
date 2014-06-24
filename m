From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:09 -0300
Subject: [Buildroot] [PATCH 03/54] kexec: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kexec/kexec.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 9787038..609825a 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -7,6 +7,8 @@
 KEXEC_VERSION = 2.0.7
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
+KEXEC_LICENSE = GPLv2
+KEXEC_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
-- 
1.8.5.5
