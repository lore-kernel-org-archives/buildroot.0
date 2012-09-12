From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Sep 2012 10:51:56 -0300
Subject: [Buildroot] [PATCH 3/3] patch: bump to version 2.7
In-Reply-To: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347457916-23684-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patch/patch.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index b4206c5..346aabd 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,9 @@
 #
 #############################################################
 
-PATCH_VERSION = 2.6
+PATCH_VERSION = 2.7
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
+PATCH_LICENSE = GPLv3+
+PATCH_LICENSE_FILE = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
