From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 23:25:55 +0100
Subject: [Buildroot] [git commit branch/next] package/drbd-utils: bump to
 version 9.12.0
Message-ID: <20200225221429.D85198E952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=810d3867475f4355addccf88687e8b61996071b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/drbd-utils/drbd-utils.hash | 4 ++--
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 884d6790ec..79914af508 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e07d156ce6e3d93ac1b69fa9bf8695038e6e5edfb2c80c91a1098d1477478ecb  drbd-utils-9.11.0.tar.gz
-sha256 1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
+sha256  16a6d000aac7f746419839a2c2afcb71fa8779fe0b5898e967767791cb8f4bc7  drbd-utils-9.12.0.tar.gz
+sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 55ac9d9dc0..a24cc4ade6 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.11.0
+DRBD_UTILS_VERSION = 9.12.0
 DRBD_UTILS_SITE = http://www.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
