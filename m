From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Oct 2014 21:28:11 +0200
Subject: [Buildroot] [PATCH 2/3] package/libva-intel-driver: Bump version to
	1.4.0
In-Reply-To: <1412623692-3322-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412623692-3322-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412623692-3322-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index b717e29..5aed95b 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.3.2
+LIBVA_INTEL_DRIVER_VERSION = 1.4.0
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-- 
1.7.10.4
