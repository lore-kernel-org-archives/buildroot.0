From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:36:20 +0200
Subject: [Buildroot] [git commit] package/rauc: Version bump to 0.4
Message-ID: <20180425193623.E2FC088D9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efac5b38b97444b787a17e7a567de45ad4080cd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.4 supports bootloader updates to eMMC boot partitions.

Signed-off-by: Jim Brennan <jbrennan@impinj.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 91d7c1d62e..a16340f185 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.3/rauc-0.3.tar.xz.asc
-sha256 dc01bfb08b1830376782f9a51cfec290171519267ab97cc909435da9ac6d6d98 rauc-0.3.tar.xz
+# https://github.com/rauc/rauc/releases/download/v0.4/rauc-0.4.tar.xz.asc
+sha256 89656b6330ac1f31293d450f5179896397c588ab52e77ec229382a6abd125d35 rauc-0.4.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 63fbc53022..f1705a8c33 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 0.3
+RAUC_VERSION = 0.4
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
