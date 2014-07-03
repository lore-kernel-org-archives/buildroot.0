From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Jul 2014 17:00:37 -0300
Subject: [Buildroot] [PATCH 2/4] bootutils: add license information
In-Reply-To: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404417639-5879-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bootutils/bootutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index caee2fd..014df8f 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -6,7 +6,7 @@
 
 BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
-
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
+BOOTUTILS_LICENSE = GPLv2+
 
 $(eval $(autotools-package))
-- 
1.8.5.5
