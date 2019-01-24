From: Christian Stewart <christian@paral.in>
Date: Thu, 24 Jan 2019 00:16:33 -0800
Subject: [Buildroot] [PATCH 1/1] go: security bump to 1.11.5
Message-ID: <20190124081633.16600-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Go 1.11.5 addresses a reported security issue, CVE-2019-6486.

Signed-off-by: Christian Stewart <christian@paral.in>
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
 
-- 
2.19.2
