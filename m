From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 10:46:22 +0100
Subject: [Buildroot] [git commit] go: security bump to 1.11.5
Message-ID: <20190124094754.5250D8D7A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ab3cb7a9752b9d5418f883f6287ba766eea0c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go 1.11.5 addresses a reported security issue, CVE-2019-6486.

Signed-off-by: Christian Stewart <christian@paral.in>
Acked-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index ee1c881e6a..29891399c3 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	4cfd42720a6b1e79a8024895fa6607b69972e8e32446df76d6ce79801bbadb15  go1.11.4.src.tar.gz
+sha256	bc1ef02bb1668835db1390a2e478dcbccb5dd16911691af9d75184bbe5aa943e  go1.11.5.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 0d7b961dda..7755a3f785 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.4
+GO_VERSION = 1.11.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
