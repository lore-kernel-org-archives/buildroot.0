From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:38:00 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/stress-ng: bump
 version
Message-ID: <20180823214248.28C8B8E47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d831ad4844a2caaf4337ed9b0e75caaf45c0e408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 18a3556220d0cec58fccff990fcf271375eeda1b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index e735439a7e..7455288c17 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0e1d7733b35f594f7461dedbf836bd4966d0611da4cd4e85cde4804d2a425e6d	stress-ng-0.06.15.tar.gz
+sha256  0de97212a83b2f8a34ee31ef32a7bc69066ed49ebdc59b51aa4060cb95e29321  stress-ng-0.09.32.tar.xz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 794e87554e..d83240817a 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.06.15
+STRESS_NG_VERSION = 0.09.32
+STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
