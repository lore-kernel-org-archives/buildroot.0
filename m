From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] orc: bump version
Message-ID: <20140424113619.719079B8D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da0630f25bc46e8f2747a81a65db476e4f2e57b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New upstream URL. Maintenance release:

  - Fix out-of-tree builds (Edward Hervey)
  - Fix many memory leaks, compiler warnings and coverity warnings (Tim-Philipp M??ller,
    Olivier Cr??te, Todd Agulnick, Sebastian Dr??ge, Vincent Penquerc'h, Edward Hervey)
  - Documentation fix for mulhsw, mulhuw (William Manley)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 8db58e9..b67823f 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.18
-ORC_SITE = http://code.entropywave.com/download/orc/
+ORC_VERSION = 0.4.19
+ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc/
 ORC_LICENSE = BSD-2c, BSD-3c
 ORC_LICENSE_FILES = COPYING
 ORC_INSTALL_STAGING = YES
