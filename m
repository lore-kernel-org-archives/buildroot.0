From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 23:30:06 +0200
Subject: [Buildroot] [git commit] polarssl: fix download URL
Message-ID: <20130627213213.2DF5C9B256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04ac296a3b7230c23afbed2c8db9309ed91366ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to a non-redirect download URL to fix:
http://autobuild.buildroot.net/results/ec3/ec340fffa6eebb18a0746097419359b44c557a90/
Thanks go to Paul Bakker for the quick response!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/polarssl/polarssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 39de3e3..f3bc421 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLARSSL_SITE = https://polarssl.org/download
+POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.8
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
