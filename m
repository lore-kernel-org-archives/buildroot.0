From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:27 +0200
Subject: [Buildroot] [git commit branch/next] libftdi: handle libftdi-config
	script
Message-ID: <20130511204539.404E29A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cfe29abf8603798c5389aa6bdb5c9a41b55ff28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libftdi/libftdi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
