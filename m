From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:30:35 +0100
Subject: [Buildroot] [git commit branch/next] nmap: bump version to 7.00
Message-ID: <20151123173052.9530E80E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=764739042d5d7395a61517662271c0c64c909de8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nmap/nmap.hash |    2 +-
 package/nmap/nmap.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 8c8da00..c7b3cf5 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 8fa11e9e203ce2d81a207db5ca4f110a525f6c01c1dd0018325a7112a51aa591 nmap-6.47.tar.bz2
+sha256 9f442301c615c608a385831c3505cdfed9b0795cd100f1a258b04509802802ae  nmap-7.00.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 1a0e977..c4fbe72 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 6.47
+NMAP_VERSION = 7.00
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
