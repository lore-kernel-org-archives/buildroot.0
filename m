From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 21:47:39 +0200
Subject: [Buildroot] [git commit] package/check: bump version to 0.15.1
Message-ID: <20200726194558.39E6B8899E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5bbe8983b57e6f0595983085b97a2690b118af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/libcheck/check/blob/0.15.1/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 6287ddd104..d00956c750 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  aea2e3c68fa6e1e92378e744b1c0db350ccda4b6bd0d19530d0ae185b3d1ac60  check-0.15.0.tar.gz
+sha256  c1cc3d64975c0edd8042ab90d881662f1571278f8ea79d8e3c2cc877dac60001  check-0.15.1.tar.gz
 # License files, locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index bd3a1e6e06..f80e6b63b3 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.15.0
+CHECK_VERSION = 0.15.1
 CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
