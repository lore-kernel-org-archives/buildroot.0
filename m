From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 22:25:56 +0200
Subject: [Buildroot] [git commit branch/next] ipset: bump to version 6.12.1
Message-ID: <20120523202635.7A92396D8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a084b8b38641ecafe3db51acdfaa0b6ef48c9afb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipset/ipset.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 06393f4..3cd1263 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.11
+IPSET_VERSION = 6.12.1
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
-IPSET_AUTORECONF = YES
 IPSET_DEPENDENCIES = libmnl host-pkg-config
 IPSET_CONF_OPT = --with-kmod=no
 
