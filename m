From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:30 +0200
Subject: [Buildroot] [PATCH 08/16] libftdi: handle libftdi-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi/libftdi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index d0f5ef6..c5590ba 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -8,7 +8,7 @@ LIBFTDI_SOURCE = libftdi-$(LIBFTDI_VERSION).tar.gz
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download/
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
-
+LIBFTDI_CONFIG_SCRIPTS = libftdi-config
 LIBFTDI_AUTORECONF = YES
 
 LIBFDTI_CONF_OPT = --without-examples
-- 
1.7.9.5
