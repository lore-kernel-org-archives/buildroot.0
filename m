From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:42:41 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/go: bump version
 to 1.12.8
Message-ID: <20190902123839.D3C64890E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59240b7419faa32d2fd9e8c9f746236d732eede6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

go1.12.6 (released 2019/06/11) includes fixes to the compiler, the linker, the
go command, and the crypto/x509, net/http, and os packages.

go1.12.7 (released 2019/07/08) includes fixes to cgo, the compiler, and the
linker.

go1.12.8 (released 2019/08/13) includes security fixes to the net/http and
net/url packages.

https://golang.org/doc/devel/release.html

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81b164c537e8078f3c3a3eb374496dcc1e930dea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 13cc9baef4..acf4686e65 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8  go1.12.5.src.tar.gz
+sha256	11ad2e2e31ff63fcf8a2bdffbe9bfa2e1845653358daed593c8c2d03453c9898  go1.12.8.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a2453e001f..fecd5f032e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.5
+GO_VERSION = 1.12.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
