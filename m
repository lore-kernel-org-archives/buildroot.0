From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:40:36 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: add license
	information
Message-ID: <20150615141619.B0B9B81DD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c4d325db46c98df9f06d4bce6cd1a35ab6ae00d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds licensing informations to at91bootstrap3

[Thomas:
 - change from "BSD-2c with endorsement clause" to "Atmel License",
   because the license of AT91Bootstrap is neither a BSD-2c nor a
   BSD-3c: it does not carry the second clause of the BSD-2c or BSD-3c
   licenses giving the condition of redistribution of the binary form.]

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index ff49e14..3ca210f 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -6,6 +6,8 @@
 
 AT91BOOTSTRAP3_VERSION = v3.7.1
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
+AT91BOOTSTRAP3_LICENSE = Atmel License
+AT91BOOTSTRAP3_LICENSE_FILES = main.c
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
