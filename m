From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:42:47 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/go: bump version
 to 1.12.9
Message-ID: <20190902123839.DB5C0890E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d77d83bd3dbaa4c86c5d75b10b44a1f14976099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

For post-1.12.8 fixes. From the release notes:

go1.12.9 (released 2019/08/15) includes fixes to the linker, and the os and
math/big packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b84261e5ca9a063c7d122206796ee79a57c42d64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index acf4686e65..a4820ee67a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	11ad2e2e31ff63fcf8a2bdffbe9bfa2e1845653358daed593c8c2d03453c9898  go1.12.8.src.tar.gz
+sha256	ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc  go1.12.9.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fecd5f032e..9b7263a49a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.12.8
+GO_VERSION = 1.12.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
