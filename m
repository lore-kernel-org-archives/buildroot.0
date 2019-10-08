From: Christian Stewart <christian@paral.in>
Date: Tue,  8 Oct 2019 11:33:51 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump to 1.13.1
Message-ID: <20191008183352.9171-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 8dfcff7a73..3c6799c5fc 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	f56e48fce80646d3c94dcf36d3e3f490f6d541a92070ad409b87b6bbb9da3954  go1.12.10.src.tar.gz
+sha256	81f154e69544b9fa92b1475ff5f11e64270260d46e7e36c34aafc8bc96209358  go1.13.1.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f8727850b5..73c049412c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.10
+GO_VERSION = 1.13.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.23.0
