From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Sep 2014 09:33:02 -0300
Subject: [Buildroot] [PATCH] ipset: bump to version 6.23
Message-ID: <1411475582-25829-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset.hash | 2 ++
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/ipset/ipset.hash

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
new file mode 100644
index 0000000..12d61b9
--- /dev/null
+++ b/package/ipset/ipset.hash
@@ -0,0 +1,2 @@
+# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.23.tar.bz2.md5sum.txt
+md5	38581e52b47c94a67940351af6ea8d8c	ipset-6.23.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index d31d433..aff1902 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.22
+IPSET_VERSION = 6.23
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
1.8.5.5
