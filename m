From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 00:01:51 +0200
Subject: [Buildroot] [git commit] ipset: bump to version 6.14
Message-ID: <20121003220359.B24E8997A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2af923069ed36868e0f100b63692ef0b999b58ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipset/ipset.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index a9d05fd..b8d0a24 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.13
+IPSET_VERSION = 6.14
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkg-config
 IPSET_CONF_OPT = --with-kmod=no
+IPSET_LICENSE = GPLv2
+IPSET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
