From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  2 Jun 2015 10:46:18 +0200
Subject: [Buildroot] [PATCH v2 1/3] boot/at91bootstrap3: add license
	information
In-Reply-To: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1433234780-21084-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds licensing informations to at91bootstrap3

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
 - Fixed license with a more appropriate one

 boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index ff49e14..a997152 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -6,6 +6,8 @@
 
 AT91BOOTSTRAP3_VERSION = v3.7.1
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
+AT91BOOTSTRAP3_LICENSE = BSD-2c with endorsement clause
+AT91BOOTSTRAP3_LICENSE_FILES = main.c
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
-- 
2.4.2
