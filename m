From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Dec 2012 10:21:54 -0300
Subject: [Buildroot] [PATCH] at91bootstrap: upstream moved to another URL
Message-ID: <1355145714-24628-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/at91bootstrap/at91bootstrap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index d8caed7..46862c0 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_SITE = http://www.atmel.com/dyn/resources/prod_documents/
+AT91BOOTSTRAP_SITE = http://www.atmel.com/Images
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
-- 
1.7.8.6
