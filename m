From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:51 +0100
Subject: [Buildroot] [PATCH 09/14] automake: bump to 1.11
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-10-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/automake/automake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 65db386..27208bc 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -3,7 +3,7 @@
 # automake
 #
 #############################################################
-AUTOMAKE_VERSION = 1.10
+AUTOMAKE_VERSION = 1.11
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
-- 
1.6.6
