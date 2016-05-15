From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:41:30 +0200
Subject: [Buildroot] [git commit] openvpn: security bump to version 2.3.11
Message-ID: <20160515204148.7349D8014B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=814e99d21a23cabd0b93c5b5abb55fe22e6a50b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed port-share bug with DoS potential.
Fix buffer overflow by user supplied data.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 4ab916e..179198e 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	52f16bef3a02369682f1464fbd2821070c98d0bd993f4c46c764e87375abdcc1 	openvpn-2.3.9.tar.xz
+sha256	0f5f1ca1dc5743fa166d93dd4ec952f014b5f33bafd88f0ea34b455cae1434a7 	openvpn-2.3.11.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1d06636..f3985cd 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.9
+OPENVPN_VERSION = 2.3.11
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
