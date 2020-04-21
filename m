From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:23:48 +0200
Subject: [Buildroot] [git commit] package/oniguruma: bump to version 6.9.5
Message-ID: <20200421060922.C1C388F691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab8964ae77c03213ccb3d730117634e0521f6524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (update in year):
https://github.com/kkos/oniguruma/commit/1952e8970a7449d5ca42a7f3bd9ce26ec6e32f43

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index b0764ab1fc..82354d4b9e 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4669d22ff7e0992a7e93e116161cac9c0949cd8960d1c562982026726f0e6d53  onig-6.9.4.tar.gz
-sha256  ae266a1ad1c2ef50baf14a1a2993e926cd46d09c6cc8b0b3a8498e44da2746b8  COPYING
+sha256  2f25cc3165e6da4b12dcabdb6b77c48f436d835e127ec2e3cad7abae9ea8e9a6  onig-6.9.5.tar.gz
+sha256  6c7038393e8f30fee16257e713f77e383712f1465d6d25929596746b10b42bd3  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 2126ff9120..d1ff1f115f 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.4
+ONIGURUMA_VERSION = 6.9.5
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
