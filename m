From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 23:14:16 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to version 1.5.10
Message-ID: <20210319215633.642058840D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d34f999566ba6ca35f9c9af9c1424b166154f25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

go1.15.9 (released 2021/03/10) includes security fixes to the encoding/xml
package.  See the Go 1.15.9 milestone on our issue tracker for details.

go1.15.10 (released 2021/03/11) includes fixes to the compiler, the go
command, and the net/http, os, syscall, and time packages.  See the Go
1.15.10 milestone on our issue tracker for details.

https://golang.org/doc/devel/release.html#go1.15.minor

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index cbc82a9b64..19962633fb 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2  go1.15.8.src.tar.gz
+sha256  c1dbca6e0910b41d61a95bf9878f6d6e93d15d884c226b91d9d4b1113c10dd65  go1.15.10.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 7b7f173706..ff863032bd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.8
+GO_VERSION = 1.15.10
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
