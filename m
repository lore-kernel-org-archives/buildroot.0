From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  2 Jun 2015 10:46:19 +0200
Subject: [Buildroot] [PATCH v2 2/3] boot/at91bootstrap3: bump to version
	3.7.2
In-Reply-To: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1433234780-21084-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps at91bootstrap3 version to 3.7.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
 - No changes

 boot/at91bootstrap3/at91bootstrap3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index a997152..2e25617 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT91BOOTSTRAP3_VERSION = v3.7.1
+AT91BOOTSTRAP3_VERSION = v3.7.2
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 AT91BOOTSTRAP3_LICENSE = BSD-2c with endorsement clause
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
-- 
2.4.2
