From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2011 15:05:09 -0300
Subject: [Buildroot] [PATCH 1/2] kismet: bump to version 2011-03-R2
Message-ID: <1303927510-18047-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kismet/kismet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 482c7db..b143ef3 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-KISMET_VERSION = 2010-07-R1
+KISMET_VERSION = 2011-03-R2
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = libpcap ncurses
 
-- 
1.7.3.4
