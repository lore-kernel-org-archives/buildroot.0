From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Mar 2014 10:48:41 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: security bump to version 4.1.6
In-Reply-To: <1394632121-17467-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394632121-17467-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394632121-17467-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4496 and CVE-2013-6442.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 72710bf..939cf0c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.5
+SAMBA4_VERSION = 4.1.6
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
1.8.3.2
