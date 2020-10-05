From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  5 Oct 2020 21:42:23 +0200
Subject: [Buildroot] [PATCH] package/prosody: bump to version 0.11.7
Message-ID: <20201005194223.462274-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 868b781f9..dc4e567d4 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  e49a0cff05b307f9010bffafdec60b6d  prosody-0.11.6.tar.gz
-sha1  3c24f3faf7735c570213da74eba6343c3afdf50d  prosody-0.11.6.tar.gz
-sha256  cda1db631c5f91f8439c66c9204dbf3bc41efd65313f7f5d3c88121ff9141755  prosody-0.11.6.tar.gz
-sha512  4ba048f686d3780ed9a58d81bbb791bec85d6c1caf60793fa85f9921c5352d74ccfc70b3c8db57a16edd8ad8f05cfc26e1403e4e2d0fa53a0d2ecc238dd2781d  prosody-0.11.6.tar.gz
+md5  a9bf18a713804b5cc9d0322d1bf5d5d8  prosody-0.11.7.tar.gz
+sha1  425e1c7ca37464b31711da8eb4a4c9444a70360f  prosody-0.11.7.tar.gz
+sha256  28ffc07653485cb63e22b387d3ea4825ee2baaee0c5827de4d6053a35b1c8747   prosody-0.11.7.tar.gz
+sha512  923aa92598ef851ed8408931942859f78f1e3d700fee251f4f5ca67abdcdae43448318ed90a9a1cdc7824d5f4dc5a4732fad4b9ed36d97455fa9b3bff0881a20  prosody-0.11.7.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 2bf4f3e79..ad51f6797 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.6
+PROSODY_VERSION = 0.11.7
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.25.1
