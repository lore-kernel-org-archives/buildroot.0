From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:29:43 +0200
Subject: [Buildroot] [git commit] qextserialport: Bump version and change
	site
Message-ID: <20150726214034.0B05E7FE99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b97d38e9e84658a8abaad6bbf0e323d496e415d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is a closing forge, qextserialport has already made the move
to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/qextserialport.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

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
