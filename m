From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:38 +0200
Subject: [Buildroot] [PATCH 16/16] sane-backends: handle sane-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sane-backends/sane-backends.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 496dca4..9022845 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -6,6 +6,7 @@
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
 SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/3503
+SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
-- 
1.7.9.5
