From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:56 +0100
Subject: [Buildroot] [PATCH 06/33] sylpheed: fix build disabling gpgme
	support
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/sylpheed/sylpheed.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index cf55c90..3ac2e1e 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -9,7 +9,7 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
-SYLPHEED_CONF_OPT = --disable-gtkspell
+SYLPHEED_CONF_OPT = --disable-gtkspell --disable-gpgme
 
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
-- 
1.8.0
