From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 17:44:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.15.0
Message-ID: <20200829154449.2171104-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://botan.randombit.net/news.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 15e79bbe40..e8d62aa98c 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  0c10f12b424a40ee19bde00292098e201d7498535c062d8d5b586d07861a54b5  Botan-2.14.0.tar.xz
+sha256  d88af1307f1fefac79aa4f2f524699478d69ce15a857cf2d0a90ac6bf2a50009  Botan-2.15.0.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index a5551b110f..19677a40e0 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.14.0
+BOTAN_VERSION = 2.15.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.28.0
