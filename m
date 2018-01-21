From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:34 +0100
Subject: [Buildroot] [PATCH 7/8] luaossl: bumpp to version 20171028
In-Reply-To: <20180121110335.20927-1-francois.perrad@gadz.org>
References: <20180121110335.20927-1-francois.perrad@gadz.org>
Message-ID: <20180121110335.20927-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/luaossl.hash | 2 +-
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 84e6e64e3..8c91a1fcf 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9c1df5a0e83f0f867850047f5e42009a15864fb7e40afa028d86523bcc840fae  luaossl-20170901-0.src.rock
+sha256 f9c94c97579efddf8abad1e373e0fe0ecc93d00cd9d1bd49f48c5716c281a08b  luaossl-20171028-0.src.rock
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 07d4ef2a0..26021a73a 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20170901
+LUAOSSL_VERSION_UPSTREAM = 20171028
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
-- 
2.11.0
