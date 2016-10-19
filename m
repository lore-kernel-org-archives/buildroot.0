From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 11:24:33 +0200
Subject: [Buildroot] [git commit] go: bump to 1.7.2
Message-ID: <20161019093219.C92DE819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=244ab37fbc591146bc2e117b08acf9d54681d0cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6826891..ff0e8f7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 787b0b750d037016a30c6ed05a8a70a91b2e9db4bd9b1a2453aa502a63f1bccc   go1.6.2.src.tar.gz
+sha256 ce4f331352313ad7ba9db5daf6f7f81581f3ca9c862d272ae02ee5a3cb294023  go1.7.2.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index d5d964f..057d9fd 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.6.2
+GO_VERSION = 1.7.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
