From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:34:47 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: bump version
 to 1.15.11
Message-ID: <20210404092642.96A2C8B679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abfb504eafa8bb94cf63b2ef669884fbbacc70db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

go1.15.11 (released 2021/04/01) includes fixes to cgo, the compiler, linker,
runtime, the go command, and the database/sql and net/http packages

https://golang.org/doc/go1.15

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 19962633fb..871ac026e1 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  c1dbca6e0910b41d61a95bf9878f6d6e93d15d884c226b91d9d4b1113c10dd65  go1.15.10.src.tar.gz
+sha256  f25b2441d4c76cf63cde94d59bab237cc33e8a2a139040d904c8630f46d061e5  go1.15.11.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ff863032bd..d3462e308a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.10
+GO_VERSION = 1.15.11
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
