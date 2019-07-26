From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 23:14:36 +0200
Subject: [Buildroot] [git commit] package/luaossl: bump to version 20190612
Message-ID: <20190726211233.35744880B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef37aaf56ce096611776f06d52931349e184b8fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file is changed due to the following
modification:

-2015-2018  Daurnimator <quae@daurnimator.com>
+2015-2019  Daurnimator <quae@daurnimator.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 981ad10a16..25b1bfa71c 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 b0af04a5ad83c12badaf0e988dbeddc98ad6d2cd9fc06baaf0c801290ae1a5bd  luaossl-20181207-0.src.rock
-sha256 7c397b120b8356805c17ba10fdea13d4319b1ee244703813d0de4cbb22720c74  luaossl-rel-20181207/LICENSE
+sha256 9a2c8ed215eaeb9533a949556b2baf869922a92d525099f25a79742b9dce8760  luaossl-20190612-0.src.rock
+sha256 7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20190612/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index aa3937bb01..d6400d45da 100644
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
