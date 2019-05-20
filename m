From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 10:23:02 +0200
Subject: [Buildroot] [git commit branch/next] package/connman: bump to
 version 1.37
Message-ID: <20190520081749.83AE57FE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2529cdd7a3ff4efb805dc92cdea0cd367e786001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index fad1c55d2d..ff5b4d48f0 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256 c789db41cc443fa41e661217ea321492ad59a004bebcd1aa013f3bc10a6e0074  connman-1.36.tar.xz
+sha256 6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16  connman-1.37.tar.xz
 # Locally computed
 sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index b67d1c4b86..839bc7a0e2 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.36
+CONNMAN_VERSION = 1.37
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
