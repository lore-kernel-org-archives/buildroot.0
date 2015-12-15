From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:42 +0100
Subject: [Buildroot] [git commit] pppd: comma separate licenses
Message-ID: <20151215210844.1FF9280409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e784e61597829f71c4326a0609b68a34d5130dd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
