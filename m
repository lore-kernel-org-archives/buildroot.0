From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:31:35 +0200
Subject: [Buildroot] [git commit] package/go: bump to go 1.15.1
Message-ID: <20200906122344.D94A187593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9400e8a4c3e7c48dd7f45ba132f7df9195f1bbe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go 1.14, 1.15 are major releases of Go.

Read the Release Notes for more information:

 - https://golang.org/doc/go1.14
 - https://golang.org/doc/go1.15

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f58449d079..5e8ab36123 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	197333e97290e9ea8796f738d61019dcba1c377c2f3961fd6a114918ecc7ab06  go1.13.14.src.tar.gz
+sha256	d3743752a421881b5cc007c76b4b68becc3ad053e61275567edab1c99e154d30  go1.15.1.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ee68014355..992d91ff2a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.14
+GO_VERSION = 1.15.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
