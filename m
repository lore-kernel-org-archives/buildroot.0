From: Christian Stewart <christian@paral.in>
Date: Sat,  6 Jun 2020 13:36:47 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to 1.13.12
Message-ID: <20200606203647.36297-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go1.13.9 (released 2020/03/19) includes fixes to the go command, tools, the
runtime, the toolchain, and the crypto/cypher package.

go1.13.10 (released 2020/04/08) includes fixes to the go command, the runtime,
and the os/exec and time packages.

go1.13.11 (released 2020/05/14) includes fixes to the compiler.

go1.13.12 (released 2020/06/01) includes fixes to the runtime, and the go/types
and math/big packages.

Release notes: https://golang.org/doc/go1.13

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index dc966e85d2..a874345762 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	b13bf04633d4d8cf53226ebeaace8d4d2fd07ae6fa676d0844a688339debec34  go1.13.8.src.tar.gz
+sha256	17ba2c4de4d78793a21cc659d9907f4356cd9c8de8b7d0899cdedcef712eba34  go1.13.12.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 64edbf3da1..c26b9f1c83 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.8
+GO_VERSION = 1.13.12
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.27.0
