From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 15:30:01 +0100
Subject: [Buildroot] [git commit] pppd: bump to version 2.4.6
Message-ID: <20140228143133.AC99C9B2D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49b239ab20e632792a6c61173ba830cdc2128ebf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/pppd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index a69d597..0e24bd2 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPPD_VERSION = 2.4.5
+PPPD_VERSION = 2.4.6
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
