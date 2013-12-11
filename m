From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:39 -0300
Subject: [Buildroot] [PATCH 06/16] libexif: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libexif/libexif.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index a1d4475..b59243a 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -10,5 +10,7 @@ LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXI
 LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkgconf
+LIBEXIF_LICENSE = LGPLv2.1+
+LIBEXIF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
