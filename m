From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 10:33:56 -0300
Subject: [Buildroot] [PATCH 2/5] automake: bump to version 1.11.5
In-Reply-To: <1336743239-6368-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336743239-6368-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336743239-6368-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/automake/automake.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 7f35f3f..522e22c 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -3,8 +3,8 @@
 # automake
 #
 #############################################################
-AUTOMAKE_VERSION = 1.11.1
-AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
+
+AUTOMAKE_VERSION = 1.11.5
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
-- 
1.7.3.4
