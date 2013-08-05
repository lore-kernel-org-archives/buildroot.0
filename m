From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Aug 2013 13:21:13 -0300
Subject: [Buildroot] [PATCH 3/3] gnupg: security bump to version 1.4.14
In-Reply-To: <1375719673-548-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375719673-548-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1375719673-548-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4242.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg/gnupg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 39088c3..f0c4b03 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.13
+GNUPG_VERSION = 1.4.14
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
-- 
1.8.1.5
