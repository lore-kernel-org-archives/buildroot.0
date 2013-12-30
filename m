From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 30 Dec 2013 18:41:23 +0100
Subject: [Buildroot] [PATCH 1/1] transmission: version bump to 2.8.2
Message-ID: <BLU0-SMTP836DDC88AF848215E0249AD9CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/transmission/transmission.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 1e7ee48..3ced558 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.33
+TRANSMISSION_VERSION = 2.82
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
-- 
1.7.9.5
