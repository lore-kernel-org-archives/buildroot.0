From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:30:13 +0200
Subject: [Buildroot] [git commit] package/go: bump version to 1.12.5
Message-ID: <20190507202456.0806982B77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce32fa6cc1decd07ced9f944e7ea6aa51dd0c49d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a number of issues discovered since 1.12.4.  From the release notes:

go1.12.5 (released 2019/05/06) includes fixes to the compiler, the linker,
the go command, the runtime, and the os package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index df3a9c4e43..13cc9baef4 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	4affc3e610cd8182c47abbc5b0c0e4e3c6a2b945b55aaa2ba952964ad9df1467  go1.12.4.src.tar.gz
+sha256	2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8  go1.12.5.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f31b1941c4..a2453e001f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.4
+GO_VERSION = 1.12.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
