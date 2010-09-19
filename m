From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:36 -0700
Subject: [Buildroot] [PATCH 14/21] make: bump to 3.82
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-15-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/make/make.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 12d236a..6beccf3 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -3,7 +3,7 @@
 # make
 #
 #############################################################
-MAKE_VERSION:=3.81
+MAKE_VERSION:=3.82
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-- 
1.7.2.3
