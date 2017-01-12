From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 12 Jan 2017 13:38:31 +0000
Subject: [Buildroot] [PATCH 2/2] vala: bump version to 0.35.3
In-Reply-To: <20170112133831.12223-1-Vincent.Riera@imgtec.com>
References: <20170112133831.12223-1-Vincent.Riera@imgtec.com>
Message-ID: <20170112133831.12223-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index ca5873c..7b6c287 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.4.sha256sum
-sha256 6b17bd339414563ebc51f64b0b837919ea7552d8a8ffa71cdc837d25c9696b83  vala-0.34.4.tar.xz
+# From https://download.gnome.org/sources/vala/0.35/vala-0.35.3.sha256sum
+sha256 2d61184a2b483fe82f6f588271cd95575ed039e830a4d80d46774124b2e2b982  vala-0.35.3.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index baa97ab..c118c34 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).4
+VALA_VERSION_MAJOR = 0.35
+VALA_VERSION = $(VALA_VERSION_MAJOR).3
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
-- 
2.10.2
