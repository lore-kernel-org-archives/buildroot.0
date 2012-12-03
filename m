From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:11 -0300
Subject: [Buildroot] [PATCH 13/14] links: bump to version 2.7
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/links/links.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 5db2ff7..f7401bb 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-LINKS_VERSION = 2.5
+LINKS_VERSION = 2.7
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
+LINKS_LICNSE = GPLv2+
+LINKS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPT += --enable-graphics
-- 
1.7.8.6
