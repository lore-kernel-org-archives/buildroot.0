From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:07:20 +0200
Subject: [Buildroot] [git commit] package/tmux: bump version to 2.9
Message-ID: <20190930210314.58F1A83D6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e150ed86a19e148a5058238ea16f4a82735c557e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://raw.githubusercontent.com/tmux/tmux/2.9/CHANGES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tmux/tmux.hash | 2 +-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 306dc52c33..81a6306807 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 7f6bf335634fafecff878d78de389562ea7f73a7367f268b66d37ea13617a2ba  tmux-2.8.tar.gz
+sha256 34901232f486fd99f3a39e864575e658b5d49f43289ccc6ee57c365f2e2c2980  tmux-2.9.tar.gz
 sha256 ce75f1345a76c93bd0f413d1b93ff1baa0669f34a7242779a00c1b862b4f813a  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 8b7a96e898..596cf54be1 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.8
+TMUX_VERSION = 2.9
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
