From: Christian Stewart <christian@paral.in>
Date: Wed, 12 Sep 2018 21:23:36 -0700
Subject: [Buildroot] [PATCH v1 1/1] go: bump to v1.11
Message-ID: <20180913042336.14910-1-christian@paral.in>
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
index 9f5b80e9f5..1c766f2302 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # From https://golang.org/dl/
-sha256	6264609c6b9cd8ed8e02ca84605d727ce1898d74efa79841660b2e3e985a98bd	go1.10.2.src.tar.gz
+sha256	afc1e12f5fe49a471e3aae7d906c73e9d5b1fdd36d52d72652dde8f6250152fb	go1.11.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 73f14cc78f..57dd00b05e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.10.2
+GO_VERSION = 1.11
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.16.4
