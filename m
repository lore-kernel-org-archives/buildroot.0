From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:36:11 +0100
Subject: [Buildroot] [git commit] package/lpeg: bump to version 1.0.2
Message-ID: <20190312203343.539208ECC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=800df729a4ca0bc194dff2f3bec4776008442f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lpeg/lpeg.hash | 2 +-
 package/lpeg/lpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index da38cc8756..7a20f063f3 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256 149be31e0155c4694f77ea7264d9b398dd134eca0d00ff03358d91a6cfb2ea9d  lpeg-1.0.1-1.src.rock
+sha256 e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index 1541f33cc0..cdb2e81a5f 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 1.0.1-1
+LPEG_VERSION = 1.0.2-1
 LPEG_LICENSE = MIT
 
 $(eval $(luarocks-package))
