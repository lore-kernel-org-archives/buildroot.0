From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:23 +0200
Subject: [Buildroot] [PATCH 01/16] libcgicc: handle cgicc-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgicc/libcgicc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 80e9213..4c5664f 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -9,7 +9,7 @@ LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE=LGPLv3+
 LIBCGICC_INSTALL_STAGING=YES
 LIBCGICC_AUTORECONF=YES
-
+LIBCGICC_CONFIG_SCRIPTS = cgicc-config
 LIBCGICC_CONF_OPT = \
 	--disable-demos \
 	--disable-doc
-- 
1.7.9.5
