From: Christian Stewart <christian@paral.in>
Date: Mon, 29 Oct 2018 09:54:22 -0700
Subject: [Buildroot] [PATCH 1/1] go: bump to v1.11.1
Message-ID: <20181029165422.32105-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumps Golang host-go compiler to 1.11.1 release.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 3 ++-
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1c766f2302..d5223d7c1d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,3 @@
 # From https://golang.org/dl/
-sha256	afc1e12f5fe49a471e3aae7d906c73e9d5b1fdd36d52d72652dde8f6250152fb	go1.11.src.tar.gz
+sha256	558f8c169ae215e25b81421596e8de7572bd3ba824b79add22fba6e284db1117  go1.11.1.src.tar.gz
+
diff --git a/package/go/go.mk b/package/go/go.mk
index 57dd00b05e..ec74ba397c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11
+GO_VERSION = 1.11.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.18.1
