From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 12:04:56 +0100
Subject: [Buildroot] [git commit] package/sigrok-cli: bump to version 0.7.1
Message-ID: <20210106104732.5DC5D867BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4db6905a4681efefa7d18c0b149813ea4be6d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sigrok.org/gitweb/?p=sigrok-cli.git;a=blob;f=NEWS;h=614c910b791228203dd144f0c092204ba0491e8f;hb=6bb3c3dd27c0477705a5c0684a8c3fd506a35f48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sigrok-cli/sigrok-cli.hash | 2 +-
 package/sigrok-cli/sigrok-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigrok-cli/sigrok-cli.hash b/package/sigrok-cli/sigrok-cli.hash
index 63a3dd80aa..3231bf82cf 100644
--- a/package/sigrok-cli/sigrok-cli.hash
+++ b/package/sigrok-cli/sigrok-cli.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c  sigrok-cli-0.7.0.tar.gz
+sha256  f52413429f47d457c333db0fd068416ab7a3f9e35ca76de8624dc5ac6fb07797  sigrok-cli-0.7.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 1e017d69b8..3d1e187882 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = 0.7.0
+SIGROK_CLI_VERSION = 0.7.1
 SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
 SIGROK_CLI_LICENSE = GPL-3.0+
 SIGROK_CLI_LICENSE_FILES = COPYING
