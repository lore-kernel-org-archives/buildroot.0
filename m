From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:12:46 +0100
Subject: [Buildroot] [git commit] package/bwm-ng: bump to version 0.6.3
Message-ID: <20210308072135.B57458893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=564371c1f39283e27126908b3babc5eae37d0684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/vgropp/bwm-ng/releases/tag/v0.6.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bwm-ng/bwm-ng.hash | 2 +-
 package/bwm-ng/bwm-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
index 4b66227676..d447673f5d 100644
--- a/package/bwm-ng/bwm-ng.hash
+++ b/package/bwm-ng/bwm-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  906a2d561f2ec9e0dd68b7f51b302908e99515ea1216d0ecaf14d873ef54ae70  bwm-ng-0.6.2.tar.gz
+sha256  c1a552b6ff48ea3e4e10110a7c188861abc4750befc67c6caaba8eb3ecf67f46  bwm-ng-0.6.3.tar.gz
 sha256  8556cc15ba3c0a411bf7d94bac5870829fb725f294b450c724c1e0856a601556  COPYING
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 4a34559e3c..de09eafae5 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BWM_NG_VERSION = 0.6.2
+BWM_NG_VERSION = 0.6.3
 BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0+
