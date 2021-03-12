From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 22:45:19 +0100
Subject: [Buildroot] [git commit] package/go: security bump to 1.16.2
Message-ID: <20210312212357.2894981106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b36b4aa284466e7294ef8d3ef741b674a96a993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.16.1 (released 2021/03/10) includes security fixes to the archive/zip and
encoding/xml packages.

go1.16.2 (released 2021/03/11) includes fixes to cgo, the compiler, linker, the
go command, and the syscall and time packages.

https://golang.org/doc/devel/release.html#go1.16

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 4181fb52c5..524b6131dc 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a  go1.16.src.tar.gz
+sha256  37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea  go1.16.2.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f6cb2469a8..ff12fb0c62 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16
+GO_VERSION = 1.16.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
