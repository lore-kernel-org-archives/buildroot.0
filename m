From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:25:46 +0200
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.21.1
Message-ID: <20210629195727.1B8728E580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9b3ad8120a37a9c3f2ecc226d16be5a73fb08dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://stellarium.org/release/2021/06/24/stellarium-0.21.1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index b5290acc72..3bd1e6b3f2 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  0ada184a15729abb1b02490cb92d055ff3b61d7e   stellarium-0.21.0.tar.gz
-sha256  977fcd6776a47d34b1646727853d15968a1410c34c8ba1b3e5cfbf24b5126f13  stellarium-0.21.0.tar.gz
+sha1  cc0b2c450ecead1481317f6038512a6a52d32001  stellarium-0.21.1.tar.gz
+sha256  072309c6bc48233b39884ae558b23764d0e08eabd96b014b53d780be11a33211  stellarium-0.21.1.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 936a07c4b3..20e0e9ffec 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.21.0
+STELLARIUM_VERSION = 0.21.1
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
