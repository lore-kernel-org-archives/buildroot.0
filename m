From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 23:00:19 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.9.0
Message-ID: <20150423210626.6CBA581D47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ea4efc6f6940315e221d92b8e88fe2ed2a361a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-libinput.hash               |    6 +++---
 .../xdriver_xf86-input-libinput.mk                 |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index a07df47..9b5219f 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,3 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002540.html
-sha1	c2ec968847f85d7d503b12d63c2cc9697cbe0243				xf86-input-libinput-0.8.0.tar.bz2
-sha256	2152b0984feffe8151934ad9af29bde7fc621e0a54b0cdedbaf1abc367dea43a	xf86-input-libinput-0.8.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002586.html
+sha1	cfb19cc863bfc0a419df6b14287891ad54bc86a2				xf86-input-libinput-0.9.0.tar.bz2
+sha256	37f623b7869c700156049fa9204bafd6027bf5c3acd9017919e42199bcc666da	xf86-input-libinput-0.9.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index ec788a2..28371a2 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.8.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.9.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
