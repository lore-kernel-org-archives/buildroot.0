From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 13:12:24 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/connman: bump
	version to 1.34
Message-ID: <20170906112608.29A3C81932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d672e0c4d71727162c9d9f825507226c1a24b9fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 579568ce09a94e2f55bf80d57fc2dfac577e8d4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index f27af3d..e6485b9 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256	bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0	connman-1.33.tar.xz
+sha256	a9a0808c729c1f348fc36d8cecb52d19b72bc34cb411c502608cb0e0190fc71e	connman-1.34.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index f7c9f23..efe08a5 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.33
+CONNMAN_VERSION = 1.34
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
