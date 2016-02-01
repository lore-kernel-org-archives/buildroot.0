From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:59:00 +0100
Subject: [Buildroot] [git commit] vala: bump to version 0.30.1
Message-ID: <20160201224700.342117F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=093681947f6fe1d79b37f0190c7b914dc8bdae53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 633dfc0..8b16838 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.30/vala-0.#0.0.sha256sum
-sha256	61f0337b000f7ed6ef8c1fea87e0047d9bd7c0f91dd9c5b4eb70fd3fb883dedf	vala-0.30.0.tar.xz
+# From https://download.gnome.org/sources/vala/0.30/vala-0.30.1.sha256sum
+sha256	23add78e5c6a5e6df019d4a885c9c79814c9e0b957519ec8a4f4d826c4e5df2c	vala-0.30.1.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a0a986c..56d4db3 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.30
-VALA_VERSION = $(VALA_VERSION_MAJOR).0
+VALA_VERSION = $(VALA_VERSION_MAJOR).1
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
