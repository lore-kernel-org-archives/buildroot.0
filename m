From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:25:35 +0100
Subject: [Buildroot] [git commit] go: bump to v1.11.1
Message-ID: <20181031092342.E8B158376D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67190f763560612a7e8393d2e2af9f8c5695197c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps Golang host-go compiler to 1.11.1 release.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1c766f2302..9f908e3f03 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # From https://golang.org/dl/
-sha256	afc1e12f5fe49a471e3aae7d906c73e9d5b1fdd36d52d72652dde8f6250152fb	go1.11.src.tar.gz
+sha256	558f8c169ae215e25b81421596e8de7572bd3ba824b79add22fba6e284db1117  go1.11.1.src.tar.gz
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
 
