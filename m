From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 17:28:02 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/go: bump to
 version 1.15.6
Message-ID: <20201221224759.8C9B87FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cfa41773481928480279d7bf9f23d189246e679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

go1.15.6 (released 2020/12/03) includes fixes to the compiler, linker, runtime,
the go command, and the io package.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 267dd8b4271c72796c66d602ceb9ae1bde6cdb2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 79d6abe8df..de2cf74cbb 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1  go1.15.5.src.tar.gz
+sha256  890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817  go1.15.6.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index d2ab9b81dd..d9f4905eb9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.5
+GO_VERSION = 1.15.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
