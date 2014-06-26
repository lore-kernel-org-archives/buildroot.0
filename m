From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:56 -0300
Subject: [Buildroot] [PATCH 28/53] liberation: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-28-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liberation/liberation.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index ac387fd..815aeba 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -7,8 +7,10 @@
 LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
-
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
+# Bump to 2.x changes license!!
+LIBERATION_LICENSE = GPLv2 with exceptions
+LIBERATION_LICENSE_FILES = License.txt
 
 ifeq ($(BR2_PACKAGE_LIBERATION_MONO),y)
 define LIBERATION_INSTALL_MONO
-- 
1.8.5.5
