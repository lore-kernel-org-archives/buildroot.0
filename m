From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 23:27:40 +0200
Subject: [Buildroot] [git commit] vala: bump to version 0.30.0
Message-ID: <20151016212815.B84A381F6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c105a006bdefd4869a5771a66fb8a71137df7ff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala.hash |    4 ++--
 package/vala/vala.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 063ec21..633dfc0 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.28/vala-0.28.0.sha256sum
-sha256	0d9e3bd3f82145664875f7c29b2f544ba92d2814f75412948f774c0727fc977f	vala-0.28.0.tar.xz
+# From https://download.gnome.org/sources/vala/0.30/vala-0.#0.0.sha256sum
+sha256	61f0337b000f7ed6ef8c1fea87e0047d9bd7c0f91dd9c5b4eb70fd3fb883dedf	vala-0.30.0.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 9dedd8f..a0a986c 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.28
+VALA_VERSION_MAJOR = 0.30
 VALA_VERSION = $(VALA_VERSION_MAJOR).0
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
