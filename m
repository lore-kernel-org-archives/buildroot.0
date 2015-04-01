From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 20:03:54 +0200
Subject: [Buildroot] [git commit] vala: bump to version 0.26.2
Message-ID: <20150401181230.E8C28801F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bf60478d51ef0168d49e0e643c4ea11090bce7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.hash |    2 ++
 package/vala/vala.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
new file mode 100644
index 0000000..fcaa0e1
--- /dev/null
+++ b/package/vala/vala.hash
@@ -0,0 +1,2 @@
+# From https://download.gnome.org/sources/vala/0.26/vala-0.26.2.sha256sum
+sha256	37f13f430c56a93b6dac85239084681fd8f31c407d386809c43bc2f2836e03c4	vala-0.26.2.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 9b0fd31..292ea7e 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.18
-VALA_VERSION = $(VALA_VERSION_MAJOR).1
+VALA_VERSION_MAJOR = 0.26
+VALA_VERSION = $(VALA_VERSION_MAJOR).2
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
