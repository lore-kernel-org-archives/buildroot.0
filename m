From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:28:15 +0200
Subject: [Buildroot] [git commit branch/next] vala: bump to version 0.32.1
Message-ID: <20160810122819.D74E881D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a60010930da3e6db96b1c6961eadc9f08e1d6c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 9301964..4a4a41c 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.32/vala-0.32.0.sha256sum
-sha256	07a2aa4ede040789b4b5af817a42249d703bfe8affccb7732ca2b53d00c1fb6e	vala-0.32.0.tar.xz
+# From https://download.gnome.org/sources/vala/0.32/vala-0.32.1.sha256sum
+sha256	dd0d47e548a34cfb1e4b04149acd082a86414c49057ffb79902eb9a508a161a9	vala-0.32.1.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index b236c54..4cdc0d7 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.32
-VALA_VERSION = $(VALA_VERSION_MAJOR).0
+VALA_VERSION = $(VALA_VERSION_MAJOR).1
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
