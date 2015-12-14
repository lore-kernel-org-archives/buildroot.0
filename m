From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:52 -0300
Subject: [Buildroot] [PATCH 13/45] xz: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index ac6f809..5e1d7c6 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,7 +9,7 @@ XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
+XZ_LICENSE = GPLv2+, GPLv3+, LGPLv2.1+
 XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.4.10
