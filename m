From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:15:04 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20161029131519.8D1EC802DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44c908f31b01a66b8e9701abbae4ab6e25e94568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 0479971..ca10dc3 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b6035c0eedfdcbec965116248471c23bed7f8b7f899e403d670495325002ba78	tvheadend-8e637f9f903f6d820f701a1461b144e67665c6fa.tar.gz
+sha256 71dd3d8efa32d592342ff6955cc2cd317f07e74d2d546977eb9bc45136dd5de6  tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index af90a82..a3afec8 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 8e637f9f903f6d820f701a1461b144e67665c6fa
+TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
