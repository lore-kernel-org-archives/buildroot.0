From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jan 2014 09:11:44 -0300
Subject: [Buildroot] [PATCH 3/4] iftop: bump to version 1.0pre3
In-Reply-To: <1388837505-30232-1-git-send-email-gustavo@zacarias.com.ar>
References: <1388837505-30232-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1388837505-30232-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iftop/iftop.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index de2f1b1..29ec61a 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-IFTOP_VERSION = 1.0pre2
+IFTOP_VERSION = 1.0pre3
 IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
-
 IFTOP_DEPENDENCIES = ncurses libpcap
-
 IFTOP_LICENSE = GPLv2+
 IFTOP_LICENSE_FILES = COPYING
 
-- 
1.8.3.2
