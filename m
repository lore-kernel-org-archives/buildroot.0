From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:18:18 +0100
Subject: [Buildroot] [git commit] package/stella: bump version to 6.4
Message-ID: <20201223120721.04CF780462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25c1c2e3195825dccfae2a9c9aa776531945d701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 18e325b1e4..c40d96616a 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  59ee35a3e49f52e64fa15e0217ecda90ccb768dcb075d997e72d5e5a3198f82e  stella-6.3-src.tar.xz
+sha256  0346900e9ba4b6d532b72d956adc5078502a9bd6bbc1648bb3dd68f5ffd4859b  stella-6.4-src.tar.xz
 sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 1e2cbaf9fa..2dcfbeaccd 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.3
+STELLA_VERSION = 6.4
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
