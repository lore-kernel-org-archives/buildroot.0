From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:41:52 +0100
Subject: [Buildroot] [git commit] sed: bump to version 4.2.2
Message-ID: <20121226224226.66AA29A496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b449ed5dfb8c8f8c889f242cf3d5b27b18673c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sed/sed.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 451ba54..5535754 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -3,9 +3,11 @@
 # sed
 #
 #############################################################
-SED_VERSION = 4.2.1
-SED_SOURCE = sed-$(SED_VERSION).tar.gz
+
+SED_VERSION = 4.2.2
 SED_SITE = $(BR2_GNU_MIRROR)/sed
+SED_LICENSE = GPLv3
+SED_LICENSE_FILES = COPYING
 
 SED_CONF_OPT = --bindir=/usr/bin \
 		--libdir=/lib \
