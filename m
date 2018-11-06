From: Christian Stewart <christian@paral.in>
Date: Tue,  6 Nov 2018 14:28:10 -0800
Subject: [Buildroot] [PATCH 1/1] go: bump to v1.11.2
Message-ID: <20181106222810.6805-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumps Golang host-go compiler to 1.11.2 release.

Add hash for LICENSE.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 3 ++-
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9f908e3f03..bd6af0358f 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,3 @@
 # From https://golang.org/dl/
-sha256	558f8c169ae215e25b81421596e8de7572bd3ba824b79add22fba6e284db1117  go1.11.1.src.tar.gz
+sha256	042fba357210816160341f1002440550e952eb12678f7c9e7e9d389437942550  go1.11.2.src.tar.gz
+sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ec74ba397c..2e434f3bad 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.1
+GO_VERSION = 1.11.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.18.1
