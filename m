From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:15 -0000
Subject: [Buildroot] [git commit] ipset: bump to version 6.27
Message-ID: <20151201232114.6B0AB821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18566c37dc226fb22fee3a069afaf70a97e656b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index e0f11d9..844bebb 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.25.1.tar.bz2.md5sum.txt
-md5	e58262af2d53bda271f43883eebc8d54	ipset-6.25.1.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.27.tar.bz2.md5sum.txt
+md5	c39f8958908b1396e2c69f082b75d924	ipset-6.27.tar.bz2
 # Calculated based on the hash above
-sha256	658e15d0d0d6a7160137ef1c2bc2c8669cfee996eb9e049df8d7313e34795e7b	ipset-6.25.1.tar.bz2
+sha256	724897a80395534466142c3542184e5a480a5046140ca2a7d9097690b931b235	ipset-6.27.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index e5e9218..fff67e2 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.25.1
+IPSET_VERSION = 6.27
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
