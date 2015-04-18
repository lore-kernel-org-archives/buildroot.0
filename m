From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:24:19 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_smproxy: bump version
	to 1.0.6, add hash
Message-ID: <20150418162757.1DD4B7F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a390ba3fa87ada1d2e8be2ae36823483b56b720f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_smproxy/xapp_smproxy.hash |    2 ++
 package/x11r7/xapp_smproxy/xapp_smproxy.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.hash b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
new file mode 100644
index 0000000..7bb7bdb
--- /dev/null
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002564.html
+sha256	6cf19155a2752237f36dbf8bc4184465ea190d2652f887faccb4e2a6ebf77266	smproxy-1.0.6.tar.bz2
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 863e4f6..f51c1ec 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.5
+XAPP_SMPROXY_VERSION = 1.0.6
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SMPROXY_LICENSE = MIT
