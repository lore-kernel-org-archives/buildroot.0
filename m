From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 May 2014 08:36:22 -0300
Subject: [Buildroot] [PATCH 2/3] libtasn1: bump to version 3.5
In-Reply-To: <1399116983-5037-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399116983-5037-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399116983-5037-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtasn1/libtasn1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 122f775..e223ad5 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 3.4
+LIBTASN1_VERSION = 3.5
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
-- 
1.8.3.2
