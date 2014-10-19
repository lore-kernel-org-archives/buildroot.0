From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Oct 2014 00:02:07 +0200
Subject: [Buildroot] [git commit] connman: bump to version 1.26
Message-ID: <20141019220305.DFF74AFE40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8feb5adaa2377a0268459ffaa1497acb68371d52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.hash |    2 ++
 package/connman/connman.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
new file mode 100644
index 0000000..58f74b3
--- /dev/null
+++ b/package/connman/connman.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
+sha256	7184e4b6d954449ee00a30e188924b3e37a20ad2fd9a0b76a2bdd82c863dcf8a	connman-1.26.tar.xz
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 8efc010..3ca049a 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.25
+CONNMAN_VERSION = 1.26
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
