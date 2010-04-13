From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:05:54 +0200
Subject: [Buildroot] [PATCH 21/41] automake: bump to 1.11
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-22-git-send-email-llandwerlin@gmail.com>
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
index db935a4..e413287 100644
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
1.7.0.4
