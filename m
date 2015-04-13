From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 12:26:44 +0200
Subject: [Buildroot] [git commit] sigrok-cli: bump commit hash
Message-ID: <20150413102655.28FC2807E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=268a8f2bb0df9466c836eff8142ce004c6748705
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to some changes in libsigrok API sigrok-cli commit must be
updated as well after bumping libsigrok hash.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sigrok-cli/sigrok-cli.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 9f8b1c2..34e0a0e 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = 198487f611d8a7be4fa15017c22fa01a56551ca6
+SIGROK_CLI_VERSION = c59bf72b694ab1d08b2ea44de4349c277e206414
 # No https access on upstream git
 SIGROK_CLI_SITE = git://sigrok.org/sigrok-cli
 SIGROK_CLI_LICENSE = GPLv3+
