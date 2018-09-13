From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 20:49:41 +0200
Subject: [Buildroot] [git commit] go: bump to v1.11
Message-ID: <20180913184942.9676F880BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f99efd731c2e4f8f64ce312d535b55f1025eb593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Reviewed-by: Anisse Astier <anisse@astier.eu>
Tested-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
