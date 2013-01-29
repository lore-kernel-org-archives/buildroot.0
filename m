From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:55 -0300
Subject: [Buildroot] [PATCH 06/10] tn5250: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tn5250/tn5250.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index f43f847..7b16eb1 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -8,6 +8,8 @@ TN5250_VERSION = 0.17.4
 TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
 TN5250_MAKE_OPT = CPPFLAGS=""
 TN5250_DEPENDENCIES = ncurses
+TN5250_LICENSE = LGPLv2.1+
+TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	TN5250_CONF_OPT += --with-ssl
-- 
1.7.12.4
