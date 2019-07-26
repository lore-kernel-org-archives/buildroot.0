From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Jul 2019 19:01:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/luaossl: bump to version 20190612
In-Reply-To: <20190726170101.21463-1-francois.perrad@gadz.org>
References: <20190726170101.21463-1-francois.perrad@gadz.org>
Message-ID: <20190726170101.21463-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff LICENSE:
-2015-2018  Daurnimator <quae@daurnimator.com>
+2015-2019  Daurnimator <quae@daurnimator.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 981ad10a1..25b1bfa71 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 b0af04a5ad83c12badaf0e988dbeddc98ad6d2cd9fc06baaf0c801290ae1a5bd  luaossl-20181207-0.src.rock
-sha256 7c397b120b8356805c17ba10fdea13d4319b1ee244703813d0de4cbb22720c74  luaossl-rel-20181207/LICENSE
+sha256 9a2c8ed215eaeb9533a949556b2baf869922a92d525099f25a79742b9dce8760  luaossl-20190612-0.src.rock
+sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20190612/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index aa3937bb0..d6400d45d 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20181207
+LUAOSSL_VERSION_UPSTREAM = 20190612
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
-- 
2.20.1
