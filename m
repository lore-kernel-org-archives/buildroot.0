From: Ismael Luceno <ismael@iodev.co.uk>
Date: Mon,  6 Apr 2020 23:11:05 +0200
Subject: [Buildroot] [PATCH] package/axel: bump version to 2.17.8
Message-ID: <20200406211105.6050-1-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 9d1aecc4d902..933223ab2bdb 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256 b700b299fc8a369352a4672560ba833335142a6bfd280d5ccdc66dc2fa6bff86  axel-2.17.7.tar.xz
+sha256 19c82a095e3ea84f1e24fe6fd6018ee06af73ee03ca8ecf31b34dcc57ef4351e  axel-2.17.8.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index b7ec2efb60de..5c7e99894efa 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.7
+AXEL_VERSION = 2.17.8
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
-- 
2.26.0
