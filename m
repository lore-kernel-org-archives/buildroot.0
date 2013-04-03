From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Apr 2013 22:40:15 +0200
Subject: [Buildroot] [git commit] vtun: requires host-bison and host-flex
Message-ID: <20130403204840.89B179B467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9172282710605f355e21510107a6a87f24317f09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f321700d2b060d11e3f98ff37be24c647a77a405/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vtun/vtun.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 2affa2e..6aeca65 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -10,7 +10,7 @@
 VTUN_VERSION = 3.0.3
 VTUN_SOURCE = vtun-$(VTUN_VERSION).tar.gz
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
-VTUN_DEPENDENCIES = zlib lzo openssl
+VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
 
 VTUN_CONF_OPT = \
