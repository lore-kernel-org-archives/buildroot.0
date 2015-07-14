From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 16:42:53 -0300
Subject: [Buildroot] [PATCH v5 4/6] vala: bump to version 0.28.0
In-Reply-To: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436902975-5004-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 4 ++--
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
-- 
2.3.6
