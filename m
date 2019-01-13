From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 21:59:08 +0100
Subject: [Buildroot] [git commit] package/cryptopp: bump to version 8.0.0
Message-ID: <20190113211926.DFA3883667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67a7c675087bd747c15f202ff0167cf9dce014f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptopp/cryptopp.hash | 4 ++--
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 389f05f654..8d12a98dab 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release700.html:
-sha256  a4bc939910edd3d29fb819a6fc0dfdc293f686fa62326f61c56d72d0a366ceb0  cryptopp700.zip
+# Hash from: https://www.cryptopp.com/release800.html:
+sha256  bbfd89b348846b920d97a1d32b88c85caf0d7bb423d4fcfab7c44349aaceb82c  cryptopp800.zip
 
 # Hash for license file:
 sha256  fe5f5f187e6e38ac2f833956fc5c4cab2df08797cff07f540e4ee74f12f7ee5b  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 32b640cbed..8e3277a941 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 7.0.0
+CRYPTOPP_VERSION = 8.0.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0
