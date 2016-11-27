From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:31:20 +0100
Subject: [Buildroot] [git commit]
	package/x11r7/xdriver_xf86-input-synaptics: bump version to 1.9.0
Message-ID: <20161201222140.7D03C801E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7e5e0f406fb40aa7f9426166c7041556e8b2b39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash    | 4 ++--
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
index 3cb0758..2c31600 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-November/002652.html
-sha256	d39f100c74f3673778b53f17bab7690161925e25dd998a15dd8cc69b52e83f01	xf86-input-synaptics-1.8.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-November/002744.html
+sha256 afba3289d7a40217a19d90db98ce181772f9ca6d77e1898727b0afcf02073b5a  xf86-input-synaptics-1.9.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index d6164d0..6bd9cc4 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.8.3
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.0
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
