From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:06:58 +0100
Subject: [Buildroot] [git commit] package/nftables: bump version to 0.9.2
Message-ID: <20191104210029.F0E548E67F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55cf35d857cc5478fb8431e47586cbc47b41ab28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index a0e0d5e779..ae3404b257 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256	ad8181b5fcb9ca572f444bed54018749588522ee97e4c21922648bb78d7e7e91	nftables-0.9.0.tar.bz2
+sha256	5cb66180143e6bfc774f4eb316206d40ac1cb6df269a90882404cbf7165513f5	nftables-0.9.2.tar.bz2
 sha256	c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e	COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9f12e42c58..884a7dd1e1 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.9.0
+NFTABLES_VERSION = 0.9.2
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
