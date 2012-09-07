From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:50 -0300
Subject: [Buildroot] [PATCH 03/10] automake: bump to version 1.11.6
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/automake/automake.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 3c19085..477b10b 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-AUTOMAKE_VERSION = 1.11.5
+AUTOMAKE_VERSION = 1.11.6
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
+AUTOMAKE_LICENSE = GPLv2+
+AUTOMAKE_LICENSE_FILES = COPYING
 
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 
-- 
1.7.8.6
