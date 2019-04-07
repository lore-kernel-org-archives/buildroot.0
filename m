From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 12:06:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpc: bump to version 1.1.0
Message-ID: <20190407100655.21077-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Fix build with mpfr 4.0.2

Fixes:
 - http://autobuild.buildroot.org/results/56c0e9e7e42320cdb7f8825889ff560b80ac10d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpc/mpc.hash | 5 +++--
 package/mpc/mpc.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index 98f1447a0d..fa98f673d5 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,2 +1,3 @@
-# From http://www.multiprecision.org/index.php?prog=mpc&page=download
-sha1	b8be66396c726fdc36ebb0f692ed8a8cca3bcc66	mpc-1.0.3.tar.gz
+# Locally calculated
+sha256	6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e	mpc-1.1.0.tar.gz
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSER
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 89bbfd9c51..0e84bc2770 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.0.3
+MPC_VERSION = 1.1.0
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
-- 
2.20.1
