From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 15:07:16 +0200
Subject: [Buildroot] [git commit] package/go: bump version to 1.12.8
Message-ID: <20190815131039.33FE582C8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81b164c537e8078f3c3a3eb374496dcc1e930dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.12.6 (released 2019/06/11) includes fixes to the compiler, the linker, the
go command, and the crypto/x509, net/http, and os packages.

go1.12.7 (released 2019/07/08) includes fixes to cgo, the compiler, and the
linker.

go1.12.8 (released 2019/08/13) includes security fixes to the net/http and
net/url packages.

https://golang.org/doc/devel/release.html

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
