From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:48:56 +0200
Subject: [Buildroot] [git commit] package/go: bump to 1.15.2
Message-ID: <20200913134546.9D09282B49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddaba441d408b5219a401b13745d73eb01ed56b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.15.2 (released 2020/09/09) includes fixes to the compiler, runtime,
documentation, the go command, and the net/mail, os, sync, and testing packages.

https://golang.org/doc/devel/release.html#go1.15

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 5e8ab36123..2f5fe8aacb 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	d3743752a421881b5cc007c76b4b68becc3ad053e61275567edab1c99e154d30  go1.15.1.src.tar.gz
+sha256	28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d  go1.15.2.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 992d91ff2a..a9f2613fdb 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.1
+GO_VERSION = 1.15.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
