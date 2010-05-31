From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:24 +0200
Subject: [Buildroot] [PATCH 38/46] at91bootstrap: don't use the ATMEL_MIRROR
	thing
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6cccd9ceb4905deb8d5eff61c57f48aacd6ae743.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
