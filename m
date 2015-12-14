From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:09 -0300
Subject: [Buildroot] [PATCH 30/45] iputils: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-31-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 332e20f..7510d99 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -7,7 +7,7 @@
 IPUTILS_VERSION = s20121011
 IPUTILS_SITE = http://www.skbuff.net/iputils
 IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
-IPUTILS_LICENSE = GPLv2+ BSD-3c
+IPUTILS_LICENSE = GPLv2+, BSD-3c
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 IPUTILS_DEPENDENCIES = openssl
-- 
2.4.10
