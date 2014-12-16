From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 08:42:58 -0300
Subject: [Buildroot] [PATCH 2/2] nftables: bump to version 0.4
In-Reply-To: <1418730178-16356-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418730178-16356-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418730178-16356-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nftables/nftables.hash | 2 ++
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/nftables/nftables.hash

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
new file mode 100644
index 0000000..0b53fc9
--- /dev/null
+++ b/package/nftables/nftables.hash
@@ -0,0 +1,2 @@
+# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.4
+sha1	c557c710510c59e4280d271e5b7232af7ba3fbb7	nftables-0.4.tar.bz2
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 6c26d4d..9f18df7 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.3
+NFTABLES_VERSION = 0.4
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl readline host-bison host-flex \
-- 
2.0.4
