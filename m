From: Christian Stewart <christian@paral.in>
Date: Fri, 17 Jul 2020 12:37:18 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to 1.13.14
Message-ID: <20200717193718.621965-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go1.13.14 (released 2020/07/16) includes fixes to the compiler, vet, and
the database/sql, net/http, and reflect packages.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index ab36962775..f58449d079 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	ab7e44461e734ce1fd5f4f82c74c6d236e947194d868514d48a2b1ea73d25137  go1.13.13.src.tar.gz
+sha256	197333e97290e9ea8796f738d61019dcba1c377c2f3961fd6a114918ecc7ab06  go1.13.14.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3a4560a5ea..154c8d79bc 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.13
+GO_VERSION = 1.13.14
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.27.0
