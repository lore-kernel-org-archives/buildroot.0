From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Jan 2020 11:16:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/autofs: bump to version 5.1.6
Message-ID: <20200119101658.2008600-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autofs/autofs.hash | 2 +-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index e4c1ecaeb2..07432bf769 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 23afdad9e2fd6d41b1900be8cfecfd5aae0ad174c7708ff685ec27e280f9c0da  autofs-5.1.5.tar.xz
+sha256 dddee3d9b7388ce6cb7432832dfade25b07ef68ad48dcce01cf247b26a10caef  autofs-5.1.6.tar.xz
 
 # Hash for license files
 sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index ab2dac6a14..e9b374ec07 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.5
+AUTOFS_VERSION = 5.1.6
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
-- 
2.24.1
