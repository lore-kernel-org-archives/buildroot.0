From: Ismael Luceno <ismael@iodev.co.uk>
Date: Wed,  3 Jun 2020 23:28:33 +0200
Subject: [Buildroot] [PATCH] package/axel: bump version to 2.17.9
Message-ID: <20200603212833.18513-1-ismael@iodev.co.uk>
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
index 955b5eab59d3..66d56b658177 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256  19c82a095e3ea84f1e24fe6fd6018ee06af73ee03ca8ecf31b34dcc57ef4351e  axel-2.17.8.tar.xz
+sha256  f1364d9b55d435efc6d32218097a50a63be7b1300138e698133cf19ad3aa3a54  axel-2.17.9.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 5c7e99894efa..0d5fc2a3c6b6 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.8
+AXEL_VERSION = 2.17.9
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
-- 
2.26.2
