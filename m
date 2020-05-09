From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 14:30:49 +0200
Subject: [Buildroot] [git commit branch/next] package/nftables: bump version
 to 0.9.4
Message-ID: <20200509122125.71513910EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62c1304445b10b015bc07eb6f8496fc841d2fd9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 93c816edc7..afe16ddfaf 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256	956b915ce2a7aeaff123e49006be7a0690a0964e96c062703181a36e2e5edb78	nftables-0.9.3.tar.bz2
-sha256	c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e	COPYING
+sha256  08b8683a9db5fba980bc092b75288af98d218bbe8ab446daf2338570d0730f9a  nftables-0.9.4.tar.bz2
+sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 1eef43586c..7f797797db 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.9.3
+NFTABLES_VERSION = 0.9.4
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-bison host-flex \
