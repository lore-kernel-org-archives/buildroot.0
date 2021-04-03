From: Christian Stewart <christian@paral.in>
Date: Fri,  2 Apr 2021 23:45:38 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.16.3
Message-ID: <20210403064538.17449-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go1.16.3 (released 2021/04/01) includes fixes to the compiler, linker, runtime,
the go command, and the testing and time packages.

https://golang.org/doc/go1.16

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 4 ++--
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 524b6131dc..6d8759f97f 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea  go1.16.2.src.tar.gz
-sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
+sha256  b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25  go1.16.3.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ff12fb0c62..138b1cbd34 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.2
+GO_VERSION = 1.16.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.31.0
