From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:44 -0000
Subject: [Buildroot] [git commit] package/dhcpcd: bump version to 7.2.2
Message-ID: <20190602201234.4AC0E81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fda92007b4d0b43ecf397d91f9a30ffd3bf2a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file only got updated to 2019.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 605e87609e..6769cdac49 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-7.0.3.tar.xz.distinfo.asc
-sha256	a255d9aecceb1c77a9862f1c0d31a48ba37aab5ef2ca5ad76fc7a907b6ea292e	dhcpcd-7.0.3.tar.xz
+# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-7.2.2.tar.xz.distinfo
+sha256	3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e	dhcpcd-7.2.2.tar.xz
 # Locally calculated
-sha256	b120a64b92cfb2453b61df4457a3c0eb163ef9c1c397822826756a31581f3947	LICENSE
+sha256	213fc1a704cecdb322276fa7c95891fd1c23137d9ab572af1fc5e91b48762303	LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ae16c340d6..a0f0c2bf42 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 7.0.3
+DHCPCD_VERSION = 7.2.2
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
