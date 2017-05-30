From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:18:56 +0200
Subject: [Buildroot] [git commit branch/next] go: bump version to 1.8.3
Message-ID: <20170530211920.197F28211E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccc3395caadfb35828d10c19466c87591ba8ee9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bumping Go to 1.8.3 from 1.7.

Go 1.8 comes with significant performance improvements, particularly
around ARM: "CPU time required by our benchmark programs was reduced by
20-30% on 32-bit ARM systems."

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
