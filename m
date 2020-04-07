From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 08:01:28 +0200
Subject: [Buildroot] [git commit] package/axel: bump version to 2.17.8
Message-ID: <20200407054754.84FBF8D423@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca782384a09a8a9ff41bdd5cc960280162699512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/axel/axel.hash | 4 ++--
 package/axel/axel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 9d1aecc4d9..955b5eab59 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256 b700b299fc8a369352a4672560ba833335142a6bfd280d5ccdc66dc2fa6bff86  axel-2.17.7.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  19c82a095e3ea84f1e24fe6fd6018ee06af73ee03ca8ecf31b34dcc57ef4351e  axel-2.17.8.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index b7ec2efb60..5c7e99894e 100644
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
