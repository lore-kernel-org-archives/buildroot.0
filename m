From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 20:55:27 +0100
Subject: [Buildroot] [git commit] go: bump to 1.10
Message-ID: <20180305200716.D390C81EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=576437cdb197afdd3e6c2200a16da73943c8c050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the Go programming language to the 1.10 release.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 445a0b7c20..73c1578d0b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # From https://golang.org/dl/
-sha256	a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993	go1.9.src.tar.gz
+sha256	f3de49289405fda5fd1483a8fe6bd2fa5469e005fd567df64485c4fa000c7f24	go1.10.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 23facbdd81..4d55e16cc3 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.9
+GO_VERSION = 1.10
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
