From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:54:05 +0200
Subject: [Buildroot] [git commit] pango: bump to version 1.36.8
Message-ID: <20150331115925.3422D7FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1845c0550b4dd5260728ebb850f81c87b49c92cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.hash |    2 ++
 package/pango/pango.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
new file mode 100644
index 0000000..3486001
--- /dev/null
+++ b/package/pango/pango.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.36.8.sha256sum
+sha256	18dbb51b8ae12bae0ab7a958e7cf3317c9acfc8a1e1103ec2f147164a0fc2d07	pango-1.36.8.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 51bfbfa..4467009 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.36
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).8
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
