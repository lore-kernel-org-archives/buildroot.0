From: Christian Stewart <christian@paral.in>
Date: Fri,  6 May 2016 12:23:32 -0400
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
Message-ID: <1462551812-8952-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Golang has significant improvements to support for multiarch in later
versions. This bump is required to make many go programs functional
under arm64, for example.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index e7c72de..6826891 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  754e06dab1c31ab168fc9db9e32596734015ea9e24bc44cae7f237f417ce4efe  go1.5.3.src.tar.gz
+sha256 787b0b750d037016a30c6ed05a8a70a91b2e9db4bd9b1a2453aa502a63f1bccc   go1.6.2.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 5454fd5..720c75a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.5.3
+GO_VERSION = 1.6.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.7.3
