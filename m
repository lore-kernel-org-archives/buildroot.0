From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 07:37:33 +0200
Subject: [Buildroot] [PATCH] package/go: bump version to 1.12.9
Message-ID: <20190820053734.29149-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For post-1.12.8 fixes. From the release notes:

go1.12.9 (released 2019/08/15) includes fixes to the linker, and the os and
math/big packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index acf4686e65..a4820ee67a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	11ad2e2e31ff63fcf8a2bdffbe9bfa2e1845653358daed593c8c2d03453c9898  go1.12.8.src.tar.gz
+sha256	ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc  go1.12.9.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fecd5f032e..9b7263a49a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.8
+GO_VERSION = 1.12.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.11.0
