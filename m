From: Christian Stewart <christian@paral.in>
Date: Sat, 30 Nov 2019 11:30:31 -0800
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to 1.13.4
Message-ID: <20191130193031.1393182-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go1.13.4 (released 2019/10/31) with fixes to the net/http and syscall packages.

Signed-off-by: Christian Stewart <christian@paral.in>
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
 
-- 
2.24.0
