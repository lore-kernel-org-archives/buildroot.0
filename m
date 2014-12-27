From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 18:46:51 +0100
Subject: [Buildroot] [git commit] libxmlrpc: bump to 1.25.30 and add hash
	file
Message-ID: <20141227174706.7A6848045B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b5de43a03d432c28536cbb58fc50e5c393494b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps libxmlrpc to the latest available stable version,
and adds a hash file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libxmlrpc/libxmlrpc.hash |    2 ++
 package/libxmlrpc/libxmlrpc.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
new file mode 100644
index 0000000..d37fcfc
--- /dev/null
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 8ae6ed4ec57d50ed132b1150fc5258346eef3e291501a564f14fa97586902f98 xmlrpc-c-1.25.30.tgz
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index a8e8aa3..1b771e2 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.25.26
+LIBXMLRPC_VERSION = 1.25.30
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
