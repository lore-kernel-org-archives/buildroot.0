From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:12 -0300
Subject: [Buildroot] [PATCH 33/45] libtasn1: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-34-git-send-email-gustavo@zacarias.com.ar>
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
index 6818f30..701e0e1 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -7,7 +7,7 @@
 LIBTASN1_VERSION = 4.6
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
-LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
+LIBTASN1_LICENSE = GPLv3+, LGPLv2.1+
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
-- 
2.4.10
