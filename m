From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 Oct 2015 12:35:27 -0300
Subject: [Buildroot] [PATCH] vala: bump to version 0.30.0
Message-ID: <1445009727-10934-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
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
-- 
2.4.9
