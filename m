From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 19 Apr 2011 23:02:22 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/crosstool-NG: bump version to
	1.10.1
In-Reply-To: <1303246942-26415-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1303246942-26415-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1303246942-26415-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the same time, also use the new upstream location.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
1.7.2.3
