From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jan 2013 14:12:47 -0300
Subject: [Buildroot] [PATCH 2/2] gmp: bump to version 5.1.0
In-Reply-To: <1357319567-32479-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357319567-32479-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1357319567-32479-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 72673c7..093d60c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-GMP_VERSION = 5.0.5
-GMP_SITE = $(BR2_GNU_MIRROR)/gmp
+GMP_VERSION = 5.1.0
+GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
-- 
1.7.8.6
