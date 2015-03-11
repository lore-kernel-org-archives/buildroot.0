From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:22 +0100
Subject: [Buildroot] [PATCH 7/7] [NOT TO BE APPLIED] package/busybox: add
	afake services as example
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <f2c8684c9a6cfa5cfe8d776ac8ce4693667c329f.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/S98bar       | 0
 package/busybox/S99foo       | 0
 package/busybox/bar.defaults | 1 +
 package/busybox/busybox.mk   | 2 ++
 4 files changed, 3 insertions(+)
 create mode 100644 package/busybox/S98bar
 create mode 100644 package/busybox/S99foo
 create mode 100644 package/busybox/bar.defaults

diff --git a/package/busybox/S98bar b/package/busybox/S98bar
new file mode 100644
index 0000000..e69de29
diff --git a/package/busybox/S99foo b/package/busybox/S99foo
new file mode 100644
index 0000000..e69de29
diff --git a/package/busybox/bar.defaults b/package/busybox/bar.defaults
new file mode 100644
index 0000000..6ac867a
--- /dev/null
+++ b/package/busybox/bar.defaults
@@ -0,0 +1 @@
+FOO=BAR
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a3ac7e7..7272b05 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+BUSYBOX_SERVICES = foo bar
+
 BUSYBOX_VERSION = 1.23.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-- 
1.9.1
