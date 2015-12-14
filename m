From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:58 -0300
Subject: [Buildroot] [PATCH 19/45] pppd: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pppd/pppd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 554b830..92897be 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,7 +7,7 @@
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = https://download.samba.org/pub/ppp
-PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
+PPPD_LICENSE = LGPLv2+, LGPL, BSD-4c, BSD-3c, GPLv2+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
-- 
2.4.10
