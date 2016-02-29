From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Feb 2016 12:27:25 -0300
Subject: [Buildroot] [PATCH] xerces: enable parallel builds
Message-ID: <1456759645-16000-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems to be in place for historical reasons since it seems to build
just fine on my test rigs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xerces/xerces.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index e57949a..d04c406 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -9,7 +9,6 @@ XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
-XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
 XERCES_CONF_OPTS = \
 	--disable-threads \
-- 
2.4.10
