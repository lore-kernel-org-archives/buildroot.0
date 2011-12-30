From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Dec 2011 12:51:32 -0300
Subject: [Buildroot] [PATCH] samba: security bump to version 3.5.12
Message-ID: <1325260292-19107-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index de2c13b..4e02682 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,9 +3,9 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION = 3.5.11
-SAMBA_SOURCE = samba-$(SAMBA_VERSION).tar.gz
-SAMBA_SITE = http://ftp.samba.org/pub/samba/stable/
+
+SAMBA_VERSION = 3.5.12
+SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 
 SAMBA_SUBDIR = source3
 SAMBA_AUTORECONF = NO
-- 
1.7.3.4
