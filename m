From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:35:58 +0100
Subject: [Buildroot] [git commit] luaossl: bumpp to version 20171028
Message-ID: <20180123073700.8EA2083969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e57389d2f7b6221d853183b595c116c3666b9a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luaossl/luaossl.hash | 2 +-
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 84e6e64..8c91a1f 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9c1df5a0e83f0f867850047f5e42009a15864fb7e40afa028d86523bcc840fae  luaossl-20170901-0.src.rock
+sha256 f9c94c97579efddf8abad1e373e0fe0ecc93d00cd9d1bd49f48c5716c281a08b  luaossl-20171028-0.src.rock
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 07d4ef2..26021a7 100644
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
