From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 11:26:49 +0100
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.3.10
Message-ID: <20160201224700.195817F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06f3e7904f13ec08492fcc7f6e7287a90eac6347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 4 ++--
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 4ab916e..7197258 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	52f16bef3a02369682f1464fbd2821070c98d0bd993f4c46c764e87375abdcc1 	openvpn-2.3.9.tar.xz
+# Locally calculated
+sha256	c54dbf91d47b9533fac3b94d2b5719bdbe0d081fe8245184f91ef8a871d22003	openvpn-2.3.10.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 8f02792..5d838ee 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.9
+OPENVPN_VERSION = 2.3.10
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
