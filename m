From: Christian Stewart <christian@paral.in>
Date: Tue,  8 Oct 2019 11:33:52 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to 1.12.8
In-Reply-To: <20191008183352.9171-1-christian@paral.in>
References: <20191008183352.9171-1-christian@paral.in>
Message-ID: <20191008183352.9171-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go1.12.6 (released 2019/06/11) includes fixes to the compiler, the linker, the
go command, and the crypto/x509, net/http, and os packages.

go1.12.7 (released 2019/07/08) includes fixes to cgo, the compiler, and the
linker.

go1.12.8 (released 2019/08/13) includes security fixes to the net/http and
net/url packages.

https://golang.org/doc/devel/release.html

Signed-off-by: Christian Stewart <christian@paral.in>
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
 
-- 
2.21.0
