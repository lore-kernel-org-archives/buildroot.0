From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:06 +0100
Subject: [Buildroot] [git commit] luaossl: bump to version 20181207
Message-ID: <20181216110337.DE1E68D46F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b58c0cbdea8e851c0e8c9e77a356ac3c22dba07d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaossl/luaossl.hash | 2 +-
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 8c91a1fcf5..736994b2e1 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f9c94c97579efddf8abad1e373e0fe0ecc93d00cd9d1bd49f48c5716c281a08b  luaossl-20171028-0.src.rock
+sha256 b0af04a5ad83c12badaf0e988dbeddc98ad6d2cd9fc06baaf0c801290ae1a5bd  luaossl-20181207-0.src.rock
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 26021a73a6..aa3937bb01 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20171028
+LUAOSSL_VERSION_UPSTREAM = 20181207
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
