From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:41:43 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: bump to version 3.7.2
Message-ID: <20150615141619.B4D9C7F945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3d4c6a6fba906bc93804c1f1f6d04e761e310b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps at91bootstrap3 version to 3.7.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 3ca210f..df3896e 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT91BOOTSTRAP3_VERSION = v3.7.1
+AT91BOOTSTRAP3_VERSION = v3.7.2
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 AT91BOOTSTRAP3_LICENSE = Atmel License
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
