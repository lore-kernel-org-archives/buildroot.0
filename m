From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:37:28 +0200
Subject: [Buildroot] [git commit] package/dhcpcd: bump to version 8.0.3
Message-ID: <20190923213326.BFAE78F2C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13d91fe013e9b0200f53673755dab46a64752558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 6769cdac49..c0d68036f3 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-7.2.2.tar.xz.distinfo
-sha256	3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e	dhcpcd-7.2.2.tar.xz
+# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-8.0.3.tar.xz.distinfo
+sha256	9674971fcd5acd5a3401a0ad8eba7f0b816fec9abb4a2520332b4d8dae068f1d	dhcpcd-8.0.3.tar.xz
 # Locally calculated
 sha256	213fc1a704cecdb322276fa7c95891fd1c23137d9ab572af1fc5e91b48762303	LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index a0f0c2bf42..cd20d8f9f3 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 7.2.2
+DHCPCD_VERSION = 8.0.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
