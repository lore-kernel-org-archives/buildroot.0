From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 20:00:19 +0200
Subject: [Buildroot] [git commit] package/cryptopp: bump to version 8.2.0
Message-ID: <20190505175546.2144A7F945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e70c794df197e4c6a483c9e1b75449e3cf24298b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.hash | 4 ++--
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 5d6d8520c2..c0d442a97b 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release810.html:
-sha256  f609b453e42abbab7163191dfe060964121f04da212e2e4f2f0ebe94b7e806ae  cryptopp810.zip
+# Hash from: https://www.cryptopp.com/release820.html:
+sha256  03f0e2242e11b9d19b28d0ec5a3fa8ed5cc7b27640e6bed365744f593e858058  cryptopp820.zip
 
 # Hash for license file:
 sha256  f29d65ae3f0c8e327284f193524643ffb4d682fcca3e1740a5c6cbab0e720583  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 59ced7654c..33c8423157 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.1.0
+CRYPTOPP_VERSION = 8.2.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
