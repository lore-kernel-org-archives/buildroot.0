From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 20:59:41 +0200
Subject: [Buildroot] [git commit] nftables: bump to version 0.5
Message-ID: <20151002190156.5D5FC801A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d66ce3c56a313a7b537e0bc300132219f72b3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.hash |    4 ++--
 package/nftables/nftables.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 0b53fc9..04ecf7d 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,2 +1,2 @@
-# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.4
-sha1	c557c710510c59e4280d271e5b7232af7ba3fbb7	nftables-0.4.tar.bz2
+# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.5
+sha1	34cfe1daa33d7fd7087dd63199f64854dfb54064	nftables-0.5.tar.bz2
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 35c56e8..ccdbcd4 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.4
+NFTABLES_VERSION = 0.5
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
