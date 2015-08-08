From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:04 -0000
Subject: [Buildroot] [git commit branch/next] bmon: bump to version 3.7
Message-ID: <20150808105633.0185680414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f64210b30f6e6b717e2279298daca8a990daaa17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bmon/bmon.hash |    2 +-
 package/bmon/bmon.mk   |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
index 65747b4..810a0b9 100644
--- a/package/bmon/bmon.hash
+++ b/package/bmon/bmon.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  62c8c20d00572a7670891d4c112924786cb69ec4ca92d5052951566f000d1514  bmon-3.6.tar.gz
+sha256  a9f3d7010074a3190038a8d95df5d47aaf2046b47d872590336b5f93be084685  bmon-3.7.tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index e430bf6..0939609 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-BMON_VERSION = 3.6
+BMON_VERSION = 3.7
 BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
+BMON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 BMON_LICENSE = BSD-2c, MIT
 BMON_LICENSE_FILES = LICENSE.BSD LICENSE.MIT
 
