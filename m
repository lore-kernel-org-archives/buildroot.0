From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 21:54:34 +0200
Subject: [Buildroot] [git commit] package/go: bump version to 1.13.13
Message-ID: <20200716200259.C832E8756C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e31919878de33daaf0e5699e6aaf9e52abd19c8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.13.13 (released 2020/07/14) includes security fixes to the
crypto/x509 and net/http packages.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index a874345762..ab36962775 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	17ba2c4de4d78793a21cc659d9907f4356cd9c8de8b7d0899cdedcef712eba34  go1.13.12.src.tar.gz
+sha256	ab7e44461e734ce1fd5f4f82c74c6d236e947194d868514d48a2b1ea73d25137  go1.13.13.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index dd15ed5168..0d6630f7e3 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.12
+GO_VERSION = 1.13.13
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
