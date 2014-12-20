From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 15:54:22 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: security bump to
	1.16.3
Message-ID: <20141220145505.CCF168055C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c83604316aabbfdde3a5ca215d141cb399a67b56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- for a list of fixed CVE??s check
  http://lists.x.org/archives/xorg-announce/2014-December/002506.html
- added hash file

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.hash   |    3 +++
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
new file mode 100644
index 0000000..974e59e
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2014-December/002506.html
+sha1	cf903e3b02cd4f4b075d139ee7d6b0a3741cd9cf				xorg-server-1.16.3.tar.bz2
+sha256	5e0f443238af1078b48f6eea98a382861b59187da221c2cf714d31c1d560b0fb	xorg-server-1.16.3.tar.bz2
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 91b4f03..3b69141 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.16.2
+XSERVER_XORG_SERVER_VERSION = 1.16.3
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
