From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 21:36:30 +0200
Subject: [Buildroot] [git commit] package/mpc: bump to version 1.2.1
Message-ID: <20210411191100.A4E4683735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9620f6b05461196b6b520faf24b99ce22f9d2b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.2.0, mpc requires mpfr 4.1.0.

See https://gitlab.inria.fr/mpc/mpc/-/commit/bc3541daa63fb6f53a5ca422766ef420e3663f6a

Update indentation in hash file (two spaces).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpc/mpc.hash | 4 ++--
 package/mpc/mpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index fa98f673d5..0520a7b9b4 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e	mpc-1.1.0.tar.gz
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LESSER
+sha256  17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459  mpc-1.2.1.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 0e84bc2770..364e4c3c85 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.1.0
+MPC_VERSION = 1.2.1
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
