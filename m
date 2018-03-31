From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 09:24:39 +0200
Subject: [Buildroot] [git commit] picocom: bump to version 3.1
Message-ID: <20180331072504.598C083F05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=badff5f483cdf7409e181b233b28f7966d3ff439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picocom/picocom.hash | 2 +-
 package/picocom/picocom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index f155830493..28f2d9cdc5 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a539db95bde3a5ebd52ae58a21f40d00cc2c97bf14b1f50caffc07257989112e  picocom-3.0.tar.gz
+sha256 e6761ca932ffc6d09bd6b11ff018bdaf70b287ce518b3282d29e0270e88420bb  picocom-3.1.tar.gz
 sha256 9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 0fa60f99c3..d27c734376 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 3.0
+PICOCOM_VERSION = 3.1
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
