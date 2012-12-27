From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Dec 2012 12:39:08 -0300
Subject: [Buildroot] [PATCH 4/6] gawk: bump to version 4.0.2
In-Reply-To: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356622750-20657-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gawk/gawk.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 58c96ce..4a21592 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-GAWK_VERSION = 4.0.1
+GAWK_VERSION = 4.0.2
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
+GAWK_LICENSE = GPLv3
+GAWK_LICENSE_FILES = COPYING
 
 # Prefer full-blown gawk over busybox awk
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.8.6
