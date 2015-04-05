From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 18:53:45 +0200
Subject: [Buildroot] [git commit] package/liblinear: fix legal-info
Message-ID: <20150405171514.4B53C8195B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc453686fef6df7c80926d95f902a8ba5e419f0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblinear/liblinear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 9eff62a..d712b95 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -7,7 +7,7 @@
 LIBLINEAR_VERSION = 1.96
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3c
-LIBLINEAR_LICENSE_FILES = COPYING
+LIBLINEAR_LICENSE_FILES = COPYRIGHT
 LIBLINEAR_INSTALL_STAGING = YES
 LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 
