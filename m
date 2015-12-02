From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 07:28:38 -0300
Subject: [Buildroot] [PATCH] gcr: needs host-intltool
Message-ID: <1449052118-17702-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c31/c3177224ca2488cf4740a2d22d1a861872d2dcde/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcr/gcr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 0730eb4..a89f874 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -8,7 +8,7 @@ GCR_VERSION_MAJOR = 3.18
 GCR_VERSION = $(GCR_VERSION_MAJOR).0
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
-GCR_DEPENDENCIES = host-pkgconf libgcrypt libglib2 p11-kit
+GCR_DEPENDENCIES = host-intltool host-pkgconf libgcrypt libglib2 p11-kit
 GCR_INSTALL_STAGING = YES
 GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
 GCR_CONF_OPTS = \
-- 
2.4.10
