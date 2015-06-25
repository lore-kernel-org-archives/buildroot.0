From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jun 2015 14:57:42 -0300
Subject: [Buildroot] [PATCH] ipset: bump to version 6.25.1
Message-ID: <1435255062-29672-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset.hash | 6 ++++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 9a79180..e0f11d9 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,2 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.24.tar.bz2.md5sum.txt
-md5	8831b8f01458bf2abacc222884195a62	ipset-6.24.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.25.1.tar.bz2.md5sum.txt
+md5	e58262af2d53bda271f43883eebc8d54	ipset-6.25.1.tar.bz2
+# Calculated based on the hash above
+sha256	658e15d0d0d6a7160137ef1c2bc2c8669cfee996eb9e049df8d7313e34795e7b	ipset-6.25.1.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index be327ec..e5e9218 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.24
+IPSET_VERSION = 6.25.1
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.3.6
