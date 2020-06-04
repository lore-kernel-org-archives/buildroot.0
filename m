From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:26:37 +0200
Subject: [Buildroot] [git commit] package/axel: bump version to 2.17.9
Message-ID: <20200604212709.AD413839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55bd11f2718508a721a6b618d9fe70b24dc0cb49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 955b5eab59..66d56b6581 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256  19c82a095e3ea84f1e24fe6fd6018ee06af73ee03ca8ecf31b34dcc57ef4351e  axel-2.17.8.tar.xz
+sha256  f1364d9b55d435efc6d32218097a50a63be7b1300138e698133cf19ad3aa3a54  axel-2.17.9.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 5c7e99894e..0d5fc2a3c6 100644
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
