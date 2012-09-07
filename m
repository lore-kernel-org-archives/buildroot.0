From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:56 -0300
Subject: [Buildroot] [PATCH 09/10] gmp: add license info
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5bcc6c1..c0a74f0 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -7,6 +7,8 @@
 GMP_VERSION = 5.0.5
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
+GMP_LICENSE = GPLv3 LGPLv3
+GMP_LICENSE_FILES = COPYING COPYING.LIB
 GMP_INSTALL_STAGING = YES
 
 # Bad ARM assembly breaks on pure thumb
-- 
1.7.8.6
