From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Oct 2016 22:28:22 +0200
Subject: [Buildroot] [git commit] libgee: bump to version 0.18.1
Message-ID: <20161012203923.43A9C82266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3b22a64fbd34fe6cdeb2ea344b67635d8447c01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgee/libgee.hash | 4 ++--
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index 4c38c78..83ac810 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.18/libgee-0.18.0.sha256sum
-sha256	4ad99ef937d071b4883c061df40bfe233f7649d50c354cf81235f180b4244399	libgee-0.18.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.18/libgee-0.18.1.sha256sum
+sha256	99686bbe5a9c89ba9502c25f61314ee8efa0dd2a1159c9a639afc1458c2839a2	libgee-0.18.1.tar.xz
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 1df322c..1df54d2 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.18
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).0
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).1
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
