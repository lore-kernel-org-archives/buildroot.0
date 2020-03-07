From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 14:57:08 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/go: bump to 1.13.6
Message-ID: <20200307134712.D01BF8FB71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9dc7e076e267e4fc30d4385a7637bbe4330c3b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

go1.13.6 (released 2020/01/09) includes fixes to the runtime and the net/http
package.

https://github.com/golang/go/issues?q=milestone=Go1.13.6

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 17aea508c7582bd56a541c12107032937532641c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 7d92c80f2b..f440490b4e 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	27d356e2a0b30d9983b60a788cf225da5f914066b37a6b4f69d457ba55a626ff  go1.13.5.src.tar.gz
+sha256	aae5be954bdc40bcf8006eb77e8d8a5dde412722bc8effcdaf9772620d06420c  go1.13.6.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 2f5e384316..a0f796c21b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.13.5
+GO_VERSION = 1.13.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
