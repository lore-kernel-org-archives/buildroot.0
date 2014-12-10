From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:21:54 +0100
Subject: [Buildroot] [git commit] dhcpcd; bump to version 6.6.5
Message-ID: <20141210202207.26B09801CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa0d0f94a9fc38dff2e394742608c3168dd0aa78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/dhcpcd.hash |    2 +-
 package/dhcpcd/dhcpcd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 851849b..31ac05d 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	67ba7cfe96089150da8e12badbcc5853daefce39417364887984948bad0a37d0	dhcpcd-6.6.4.tar.bz2
+sha256	62efd1c7fa162f7277b8a09089065f726e5d4dd45f426bb5db06e879e068bbe0	dhcpcd-6.6.5.tar.bz2
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index dc663a8..ec7d0e0 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.6.4
+DHCPCD_VERSION = 6.6.5
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
