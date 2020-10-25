From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:22:44 +0100
Subject: [Buildroot] [git commit] package/go: bump to version 1.15.3
Message-ID: <20201025091141.58FAC826E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce0d25ffc7624a7456d8b53d72527ace30c606ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.15.3 (released 2020/10/14) includes fixes to cgo, the compiler, runtime, the
go command, and the bytes, plugin, and testing packages.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 1 +
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2f5fe8aacb..9d651a1bfb 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,4 @@
 # From https://golang.org/dl/
 sha256	28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d  go1.15.2.src.tar.gz
+sha256	896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888  go1.15.3.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index edc44d2378..dc3b35ff50 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.2
+GO_VERSION = 1.15.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
