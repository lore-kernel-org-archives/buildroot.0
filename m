From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 21:58:25 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/go: bump to
 version 1.15.8
Message-ID: <20210211203802.8DB018124F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b407d9e1ac652f2b6e21f34722158111d7053a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

go1.15.8 (released 2021/02/04) includes fixes to the compiler, linker, runtime,
the go command, and the net/http package.

https://golang.org/doc/go1.15

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ccbbcca9b288380b8f33a34a7ed6fe3e0c85be5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1bd7ab7ca9..cbc82a9b64 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  8631b3aafd8ecb9244ec2ffb8a2a8b4983cf4ad15572b9801f7c5b167c1a2abc  go1.15.7.src.tar.gz
+sha256  540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2  go1.15.8.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3928c8b708..b269cb3527 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.7
+GO_VERSION = 1.15.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
