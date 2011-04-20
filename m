From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Apr 2011 15:13:13 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: bump version to
	1.10.1
Message-ID: <20110420131407.CF779828A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f98c8d65bd2d7cfb9d3372f083baeb966377ef36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the same time, also use the new upstream location.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index c57876e..e52bdee 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -14,8 +14,8 @@ uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
 # Internal variables
 
 # Crostool-NG hard-coded configuration options
-CTNG_VERSION:=1.10.0
-CTNG_SITE:=http://ymorin.is-a-geek.org/download/crosstool-ng/
+CTNG_VERSION:=1.10.1
+CTNG_SITE:=http://crosstool-ng.org/download/crosstool-ng/
 CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
 CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
 CTNG_CAT:=bzcat
-- 
1.7.3.4
