From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:54:51 +0200
Subject: [Buildroot] [git commit] vala: bump to version 0.28.0
Message-ID: <20150714215509.DB9DD800CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fb117800f5256e3bc5fb7e096e1a4e2c7ee9e3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.hash |    4 ++--
 package/vala/vala.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index fcaa0e1..063ec21 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.26/vala-0.26.2.sha256sum
-sha256	37f13f430c56a93b6dac85239084681fd8f31c407d386809c43bc2f2836e03c4	vala-0.26.2.tar.xz
+# From https://download.gnome.org/sources/vala/0.28/vala-0.28.0.sha256sum
+sha256	0d9e3bd3f82145664875f7c29b2f544ba92d2814f75412948f774c0727fc977f	vala-0.28.0.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 573e1e4..9dedd8f 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.26
-VALA_VERSION = $(VALA_VERSION_MAJOR).2
+VALA_VERSION_MAJOR = 0.28
+VALA_VERSION = $(VALA_VERSION_MAJOR).0
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
