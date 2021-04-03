From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:30:41 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/frr: bump to
 7.5.1 version
Message-ID: <20210403110947.69AA58138A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d6341ebe498a617ad2a8f12e8c1ee2a44a5499e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This is a maintenance release of FRR 7.5 with lots of bug fixes:

    https://github.com/FRRouting/frr/releases/tag/frr-7.5.1

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a4a3a0295649ea80fc24664fb959c9ab4972b8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 942065f0f3..3a044d4c2a 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 54066e82a82751ec5876d9b67aa0cb24fe94e19e7371af290ac25099eda9f136  frr-7.5.tar.gz
+sha256 030d4e66f577726dfea13bd3a9c669fd41d8fd89b25953a36b5b0966d406ff28  frr-7.5.1.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 3ae292874a..0907c0ad97 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 7.5
+FRR_VERSION = 7.5.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
