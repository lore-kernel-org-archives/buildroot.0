From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 20:34:47 +0100
Subject: [Buildroot] [git commit] nettle: bump to version 3.4.1
Message-ID: <20190116193531.B9B058DE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f55099c0138374a4cadf5d3fe1003f32d7a5850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nettle 3.4.1 is a requirement for gnutls 3.6.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 473be1c2df..32ed22c6c7 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz.sig
-sha256	ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94	nettle-3.4.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.4.1.tar.gz.sig
+sha256	f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad	nettle-3.4.1.tar.gz
 # Locally calculated
 sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 9582815048..6a1144ed39 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.4
+NETTLE_VERSION = 3.4.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
