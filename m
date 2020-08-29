From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:51:28 +0200
Subject: [Buildroot] [git commit branch/next] package/spandsp: bump version
 to 3.0.0
Message-ID: <20200829204526.8AA9483FE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c983bfa543de89ab8c9374a860d2fdf8a2fb87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reformatted hashes.

Switched upstream to freeswitch repo which is maintained by the author
of spandsp:
https://github.com/signalwire/freeswitch/issues/681#issuecomment-671498542

The previous project URL http://www.soft-switch.org/ is not reachable
anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spandsp/Config.in    | 2 +-
 package/spandsp/spandsp.hash | 4 ++--
 package/spandsp/spandsp.mk   | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/spandsp/Config.in b/package/spandsp/Config.in
index a2d5b85d79..da0ca50fa2 100644
--- a/package/spandsp/Config.in
+++ b/package/spandsp/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_SPANDSP
 	  These range from simple modules, such as DTMF detection, to
 	  a complete software FAX machine.
 
-	  http://www.soft-switch.org/
+	  https://github.com/freeswitch/spandsp
diff --git a/package/spandsp/spandsp.hash b/package/spandsp/spandsp.hash
index 1123e29c1b..d38b069198 100644
--- a/package/spandsp/spandsp.hash
+++ b/package/spandsp/spandsp.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 0fcdda74bd9703dd66c3e9721bf2d81bd7c185c539d1887768c2b332ab703d51  spandsp-20180108.tar.gz
-sha256 366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  COPYING
+sha256  a11beed46b488a4cac3b0c42042ad28448bcee4c0027a82d5449180bbb178836  spandsp-3.0.0-6ec23e5a7e.tar.gz
+sha256  366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  COPYING
diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index e02c15a776..42c0e3bb69 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SPANDSP_VERSION = 20180108
-SPANDSP_SITE = https://www.soft-switch.org/downloads/spandsp/snapshots
-
+SPANDSP_VERSION = 3.0.0-6ec23e5a7e
+SPANDSP_SITE = https://files.freeswitch.org/downloads/libs
 SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
 SPANDSP_LICENSE_FILES = COPYING
 
