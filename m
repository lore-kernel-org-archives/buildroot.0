From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Oct 2017 22:02:39 +0200
Subject: [Buildroot] [git commit] ipset: bump to version 6.34
Message-ID: <20171010195717.6220781144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da1f6992c84c3d3d8d3780079e6e3e7b9748af53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 8 +++++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 9fa85f2..dcd709e 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,6 @@
-# From http://ftp.netfilter.org/pub/ipset/ipset-6.32.tar.bz2.md5sum.txt
-md5 857a5c6a6d645196865a82bf6fd7f567  ipset-6.32.tar.bz2
+# From http://ftp.netfilter.org/pub/ipset/ipset-6.34.tar.bz2.md5sum.txt
+md5 51bd03f976a1501fd45e1d71a1e2e6bf  ipset-6.34.tar.bz2
 # Calculated based on the hash above
-sha256 d9cbb49a4ae9e32d7808a604f1a37f359f9fc9064c210c4c5f35d629d49fb9fe  ipset-6.32.tar.bz2
+sha256 d70e831b670b7aa25dde81fd994d3a7ce0c0e801559a557105576df66cd8d680  ipset-6.34.tar.bz2
+# Locally calculated
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 88415f6..d729956 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.32
+IPSET_VERSION = 6.34
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
