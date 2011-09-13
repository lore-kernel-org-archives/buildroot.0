From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 13:40:14 -0300
Subject: [Buildroot] [PATCH 4/7] gmp: bump to version 5.0.2
In-Reply-To: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
References: <1315932017-20307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1315932017-20307-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cdddca1..c9e3793 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GMP_VERSION = 5.0.1
+GMP_VERSION = 5.0.2
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
-- 
1.7.3.4
