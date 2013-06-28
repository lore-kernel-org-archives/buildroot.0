From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 14:46:49 +0200
Subject: [Buildroot] [git commit] neard: bump version to 0.12
Message-ID: <20130628124854.0C90E9B281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2d06655e5684c10f6a02cc065aaf481f56a8c64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neard/neard.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 0fa30ea..56730b2 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.11
+NEARD_VERSION = 0.12
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
