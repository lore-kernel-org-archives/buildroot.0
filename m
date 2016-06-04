From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  3 Jun 2016 22:11:31 -0300
Subject: [Buildroot] [PATCH 2/2] nftables: bump to version 0.6
In-Reply-To: <1465002691-2844-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465002691-2844-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1465002691-2844-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 04ecf7d..987aae3 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,2 +1,2 @@
-# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.5
-sha1	34cfe1daa33d7fd7087dd63199f64854dfb54064	nftables-0.5.tar.bz2
+# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.6
+sha1	c0f90a208e0ab5d43d3e638350a4fe58e6f4366f	nftables-0.6.tar.bz2
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index ccdbcd4..10a1b42 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.5
+NFTABLES_VERSION = 0.6
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
-- 
2.7.3
