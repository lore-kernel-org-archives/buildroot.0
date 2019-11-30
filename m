From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2019 22:41:43 +0100
Subject: [Buildroot] [git commit] package/go: bump to 1.13.4
Message-ID: <20191130213532.86EF082D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa4218f73f9224337fdd81e631d80aff9816966b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.13.4 (released 2019/10/31) with fixes to the net/http and syscall packages.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 442a6f9ad2..90a0c2fbb8 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	4f7123044375d5c404280737fbd2d0b17064b66182a65919ffe20ffe8620e3df  go1.13.3.src.tar.gz
+sha256	95dbeab442ee2746b9acf0934c8e2fc26414a0565c008631b04addb8c02e7624  go1.13.4.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 64e831189f..dac740d968 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.3
+GO_VERSION = 1.13.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
