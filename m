From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 Jan 2013 14:14:35 +0100
Subject: [Buildroot] [git commit] neard: bump version to 0.9
Message-ID: <20130131132046.D558D9A8C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=604f35dd5f42c71adc23d787e66767fe74486e3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neard/neard.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 3c9dd7c..c3466e6 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -3,7 +3,8 @@
 # neard
 #
 #############################################################
-NEARD_VERSION = 0.8
+
+NEARD_VERSION = 0.9
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
