From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: don't use the
	ATMEL_MIRROR thing
Message-ID: <20100614203442.B8772804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc572b7e30dddd66350cc6d505ae61c4e481c9de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index d6e2c18..bad5cee 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -5,8 +5,7 @@
 #############################################################
 AT91BOOTSTRAP_VERSION:=2.13
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
-ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
-AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
+AT91BOOTSTRAP_SITE:=ftp://www.at91.com/pub/buildroot/
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
 AT91BOOTSTRAP:=$(call qstrip,$(BR2_AT91BOOTSTRAP))
-- 
1.7.1
