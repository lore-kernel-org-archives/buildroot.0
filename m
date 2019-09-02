From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 15:48:34 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/go: security bump
 to version 1.11.13
Message-ID: <20190902134625.CCEA28912D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7c2fd387d5361ff7fb5cfccd39baa76ba085b54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

From the release notes:

- go1.11.10 (released 2019/05/06) includes fixes to the runtime and the
  linker

- go1.11.11 (released 2019/06/11) includes a fix to the crypto/x509 package

- go1.11.12 (released 2019/07/08) includes fixes to the compiler and the
  linker

- go1.11.13 (released 2019/08/13) includes security fixes to the net/http
  and net/url packages

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 77aa273aa9..2b6248e929 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	ee80684b352f8d6b49d804d4e615f015ae92da41c4096cfee89ed4783b2498e3  go1.11.9.src.tar.gz
+sha256	5032095fd3f641cafcce164f551e5ae873785ce7b07ca7c143aecd18f7ba4076  go1.11.13.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 6b8b0de6b1..f510440a80 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.9
+GO_VERSION = 1.11.13
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
