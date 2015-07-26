From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:38 +0200
Subject: [Buildroot] [PATCH 12/12] qextserialport: Bump version and change
	site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-13-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, qextserialport has already made the move
to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/qextserialport/qextserialport.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 61f7b05..6f82b39 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -4,13 +4,10 @@
 #
 ################################################################################
 
-QEXTSERIALPORT_VERSION = 6c47244de4ce6db43c2f05caee957666c951dae1
-QEXTSERIALPORT_SITE = https://qextserialport.googlecode.com/git
-QEXTSERIALPORT_SITE_METHOD = git
-
+QEXTSERIALPORT_VERSION = ada321a9ee463f628e7b781b8ed00ff219152158
+QEXTSERIALPORT_SITE = $(call github,qextserialport,qextserialport,$(QEXTSERIALPORT_VERSION))
 QEXTSERIALPORT_LICENSE = MIT
 QEXTSERIALPORT_LICENSE_FILES = LICENSE
-
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT),y)
-- 
2.1.4
