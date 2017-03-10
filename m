From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 10 Mar 2017 14:19:26 +0100
Subject: [Buildroot] [PATCH] package/liberation: fixes download site due to
	recent fedorahosted.org closing
Message-ID: <1489151966-972-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

---
 package/liberation/liberation.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index dfed086..a77c014 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBERATION_VERSION = 2.00.1
-LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
+LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFLv1.1
-- 
2.1.4
