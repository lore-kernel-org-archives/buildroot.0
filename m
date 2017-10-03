From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Tue,  3 Oct 2017 15:55:25 +0200
Subject: [Buildroot] [PATCH] wireguard: version bump
Message-ID: <20171003135525.14684-1-Jason@zx2c4.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though this package was added just a day or two ago, it seems to
have committed an old version, perhaps due to the length of review.

This simply updates the package to use the newer snapshot.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 package/wireguard/wireguard.hash | 2 +-
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 5bd1163d3c..5103681e42 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7 WireGuard-0.0.20170810.tar.xz
+sha256 ecff9a184685b7dd2d81576eba5bd96bb59031c9e9b5eeee05d6dc298f30998e WireGuard-0.0.20171001.tar.xz
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 1f2190c0d7..e946e4ca39 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20170810
+WIREGUARD_VERSION = 0.0.20171001
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.14.2
