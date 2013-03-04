From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:00:01 -0300
Subject: [Buildroot] [PATCH 2/4] dosfstools: bump to version 3.0.16
In-Reply-To: <1362412803-11393-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362412803-11393-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362412803-11393-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/dosfstools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index e3cc9cf..3a0856a 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DOSFSTOOLS_VERSION = 3.0.15
+DOSFSTOOLS_VERSION = 3.0.16
 DOSFSTOOLS_SITE = http://fossies.org/linux/misc
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
-- 
1.7.12.4
