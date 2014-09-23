From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:53:54 +0200
Subject: [Buildroot] [git commit] ipset: bump to version 6.23
Message-ID: <20140923195402.790E59D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eeaee9933ceeca902d80ac8c388fc55eba9d9ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipset/ipset.hash |    2 ++
 package/ipset/ipset.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
