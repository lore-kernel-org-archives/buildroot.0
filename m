From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 19:14:08 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/go: bump to 1.13.5
Message-ID: <20191222204327.5C1738D6EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffabf709ec7875c094193d84c240ce0ecb04eef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

go1.13.5 (released 2019/12/04) includes fixes to the go command, the runtime,
the linker, and the net/http package.

https://github.com/golang/go/issues?q=milestone%3AGo1.13.5

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bdc395db0d769ce1fd23dbddadd5c9e383c591ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 90a0c2fbb8..7d92c80f2b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	95dbeab442ee2746b9acf0934c8e2fc26414a0565c008631b04addb8c02e7624  go1.13.4.src.tar.gz
+sha256	27d356e2a0b30d9983b60a788cf225da5f914066b37a6b4f69d457ba55a626ff  go1.13.5.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index dac740d968..2f5e384316 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.4
+GO_VERSION = 1.13.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
