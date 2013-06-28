From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:17:23 +0200
Subject: [Buildroot] [git commit] boa: define license
Message-ID: <20130628195140.171A19B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=734c124e97815ac1d2bb62c9d7cc6336974791c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boa/boa.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 9308b54..d6a8e23 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 BOA_VERSION = 0.94.14rc21
-BOA_SOURCE = boa-$(BOA_VERSION).tar.gz
 BOA_SITE = http://www.boa.org/
+BOA_LICENSE = GPLv2+
+BOA_LICENSE_FILES = COPYING
 
 define BOA_INSTALL_TARGET_CMDS
 	install -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
