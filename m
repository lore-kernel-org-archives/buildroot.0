From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:38:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libp11: bump to
 version 0.4.11
Message-ID: <20210426203328.C2A0F83D66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cf05f6fa44438b65539e80d6e18fab08d7b4d8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Update indentation in hash file (two spaces)

https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 281b11105a55bf7da043b6cf3528a19ed736300b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index bba5c770a2..52d73d4206 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 639ea43c3341e267214b712e1e5e12397fd2d350899e673dd1220f3c6b8e3db4  libp11-0.4.10.tar.gz
-sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
+sha256  57d47a12a76fd92664ae30032cf969284ebac1dfc25bf824999d74b016d51366  libp11-0.4.11.tar.gz
+sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 90c582571e..45a718ee99 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.10
+LIBP11_VERSION = 0.4.11
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
