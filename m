From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 14:03:09 +0100
Subject: [Buildroot] [git commit branch/next] package/mc: bump to version
 4.8.26
Message-ID: <20210223124338.C5C7681329@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e648dfa6f7078a6fbbc5feb83292c6a98300fe8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 208d0beda4..63fbfa3213 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.25.sha256
-sha256  ffc19617f20ebb23330acd3998b7fd559a042d172fa55746d53d246697b2548a  mc-4.8.25.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.26.sha256
+sha256  c6deadc50595f2d9a22dc6c299a9f28b393e358346ebf6ca444a8469dc166c27  mc-4.8.26.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 00f34f81cc..50dc50f65e 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.25
+MC_VERSION = 4.8.26
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
