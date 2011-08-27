From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Aug 2011 23:07:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/crosstool-NG: update version to
	1.12.1
In-Reply-To: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1314479263-8979-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1314479263-8979-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 2bbf631..076be28 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.12.0
+CROSSTOOL_NG_VERSION           = 1.12.1
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
-- 
1.7.2.5
