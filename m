From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 20:32:52 +0100
Subject: [Buildroot] [git commit] package/nftables: bump version to 0.9.3
Message-ID: <20200122194112.065AE83645@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0267d162a22a1b341b5fb73ef7f46147a7f9b337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index ae3404b257..93c816edc7 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256	5cb66180143e6bfc774f4eb316206d40ac1cb6df269a90882404cbf7165513f5	nftables-0.9.2.tar.bz2
+sha256	956b915ce2a7aeaff123e49006be7a0690a0964e96c062703181a36e2e5edb78	nftables-0.9.3.tar.bz2
 sha256	c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e	COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 884a7dd1e1..11ef6844ce 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.9.2
+NFTABLES_VERSION = 0.9.3
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
