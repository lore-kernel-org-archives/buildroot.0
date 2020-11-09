From: Christian Stewart <christian@paral.in>
Date: Mon,  9 Nov 2020 01:09:12 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump to 1.15.4
Message-ID: <20201109090912.909690-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 3 +--
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9d651a1bfb..eb6fe6c85a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,4 +1,3 @@
 # From https://golang.org/dl/
-sha256	28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d  go1.15.2.src.tar.gz
-sha256	896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888  go1.15.3.src.tar.gz
+sha256  063da6a9a4186b8118a0e584532c8c94e65582e2cd951ed078bfd595d27d2367  go1.15.4.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index dc3b35ff50..ccfddd8001 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.3
+GO_VERSION = 1.15.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.29.2
