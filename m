From: Christian Stewart <christian@paral.in>
Date: Tue, 30 May 2017 12:36:13 -0700
Subject: [Buildroot] [PATCH 1/1] go: bump version to 1.8.3
Message-ID: <20170530193613.27160-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping Go to 1.8.3 from 1.7.

Go 1.8 comes with significant performance improvements, particularly
around ARM: "CPU time required by our benchmark programs was reduced by
20-30% on 32-bit ARM systems."

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index e50f004..1836af2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 4c189111e9ba651a2bb3ee868aa881fab36b2f2da3409e80885ca758a6b614cc  go1.7.4.src.tar.gz
+sha256	5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6	go1.8.3.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index a461342..a64356e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.7.4
+GO_VERSION = 1.8.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.10.2
