From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 23:24:57 -0300
Subject: [Buildroot] [PATCH 1/7] gawk: bump to version 4.0.1
Message-ID: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gawk/gawk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index f1a6472..8f374cb 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GAWK_VERSION = 4.0.0
+GAWK_VERSION = 4.0.1
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
 
-- 
1.7.3.4
