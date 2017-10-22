From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 09:10:32 +0200
Subject: [Buildroot] [git commit] go: bump version to 1.9
Message-ID: <20171022100955.6933880804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3c2acba9b29aa2f9c2e36cae368ee98697002d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go 1.9 is required for docker-engine and other Go packages in Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/go.hash | 4 ++--
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1836af2..445a0b7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256	5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6	go1.8.3.src.tar.gz
+# From https://golang.org/dl/
+sha256	a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993	go1.9.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 6035164..23facbd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.8.3
+GO_VERSION = 1.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
