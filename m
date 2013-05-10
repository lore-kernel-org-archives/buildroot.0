From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:27 +0200
Subject: [Buildroot] [PATCH 05/16] libart: handle libart2-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libart/libart.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 0505ff5..822dbf1 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -9,5 +9,6 @@ LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
 LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
+LIBART_CONFIG_SCRIPTS = libart2-config
 
 $(eval $(autotools-package))
-- 
1.7.9.5
