From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Aug 2019 09:05:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/luaossl: bump to version 20190731
In-Reply-To: <20190816070510.29288-1-francois.perrad@gadz.org>
References: <20190816070510.29288-1-francois.perrad@gadz.org>
Message-ID: <20190816070510.29288-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 25b1bfa71..9b959f6fc 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 9a2c8ed215eaeb9533a949556b2baf869922a92d525099f25a79742b9dce8760  luaossl-20190612-0.src.rock
-sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20190612/LICENSE
+sha256 b558790c0d1c965bd98b98a91a44eef9f72a0b784dbb4978810a1e52206d593d  luaossl-20190731-0.src.rock
+sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20190731/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index d6400d45d..128c320d1 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20190612
+LUAOSSL_VERSION_UPSTREAM = 20190731
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
-- 
2.20.1
