From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Jun 2014 08:36:52 -0300
Subject: [Buildroot] [PATCH 2/2] samba: security bump to version 3.6.24
In-Reply-To: <1403523412-15688-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403523412-15688-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403523412-15688-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-0244 (Denial of service - CPU loop)
CVE-2014-3493 (Denial of service - Server crash/memory corruption)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 0d0a968..901c341 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.23
+SAMBA_VERSION = 3.6.24
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
-- 
1.8.5.5
