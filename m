From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:46:22 +0200
Subject: [Buildroot] [git commit] setserial: add license information
Message-ID: <20140708222427.E75AB9D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d8e8c65741edeae780cd34ddad74eeec5589aa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/setserial/setserial.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index f8d0a4b..9f28216 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-SETSERIAL_VERSION            = 2.17
-SETSERIAL_PATCH              = setserial_2.17-45.3.diff.gz
-SETSERIAL_SOURCE             = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE               = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial/
+SETSERIAL_VERSION = 2.17
+SETSERIAL_PATCH = setserial_2.17-45.3.diff.gz
+SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
+SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial/
+SETSERIAL_LICENSE = GPLv2
+SETSERIAL_LICENSE_FILES = debian/copyright
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
