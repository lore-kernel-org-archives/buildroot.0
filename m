From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 21:35:27 +0100
Subject: [Buildroot] [PATCH] package/go: bump version to 1.13.8
Message-ID: <20200213203528.2739-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes fixes ncludes fixes to the runtime, the crypto/x509, and net/http
packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index b607ce37d4..dc966e85d2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	e4ad42cc5f5c19521fbbbde3680995f2546110b5c6aa2b48c3754ff7af9b41f4  go1.13.7.src.tar.gz
+sha256	b13bf04633d4d8cf53226ebeaace8d4d2fd07ae6fa676d0844a688339debec34  go1.13.8.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 43c04ac0c5..376c3db7f0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.7
+GO_VERSION = 1.13.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.20.1
