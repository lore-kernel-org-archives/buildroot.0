From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Oct 2011 00:04:31 -0300
Subject: [Buildroot] [PATCH 5/7] links: bump to version 2.3pre2
In-Reply-To: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318734273-24454-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/links/links.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 44bf9ec..470b13d 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-LINKS_VERSION = 2.3pre1
+LINKS_VERSION = 2.3pre2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_CONF_OPT = --without-x
+LINKS_DEPENDENCIES = host-pkg-config
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPT += --enable-graphics
-- 
1.7.3.4
