From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:22:11 +0100
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.3.14
Message-ID: <20161208212228.9111481E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c021b1329155fd1ff085dcb2c7e8a36850a391e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 0c5cb09..a21608a 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9cde0c8000fd32d5275adb55f8bb1d8ba429ff3de35f60a36e81f3859b7537e0  openvpn-2.3.13.tar.xz
+sha256 f3a0d0eaf8d544409f76a9f2a238a0cd3dde9e1a9c1f98ac732a8b572bcdee98  openvpn-2.3.14.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index cd0a2d1..1765fb4 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.13
+OPENVPN_VERSION = 2.3.14
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
