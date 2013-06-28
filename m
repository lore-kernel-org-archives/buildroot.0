From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:05 -0300
Subject: [Buildroot] [PATCH 08/19] enchant: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/enchant/enchant.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 50a8a6c..8a76c6b 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -9,5 +9,7 @@ ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkgconf
+ENCHANT_LICENSE = LGPLv2.1+
+ENCHANT_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
-- 
1.8.1.5
