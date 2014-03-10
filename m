From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:24 -0300
Subject: [Buildroot] [PATCH 04/14] iftop: bump to version 1.0pre4
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iftop/iftop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index 29ec61a..91bd6cc 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IFTOP_VERSION = 1.0pre3
+IFTOP_VERSION = 1.0pre4
 IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
 IFTOP_DEPENDENCIES = ncurses libpcap
 IFTOP_LICENSE = GPLv2+
-- 
1.8.3.2
