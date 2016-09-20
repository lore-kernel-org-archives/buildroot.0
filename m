From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 12:01:35 -0300
Subject: [Buildroot] [PATCH 6/7] atk: bump to version 2.22.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474383696-4045-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 7178ccc..12c9870 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.20/atk-2.20.0.sha256sum
-sha256 493a50f6c4a025f588d380a551ec277e070b28a82e63ef8e3c06b3ee7c1238f0 atk-2.20.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.22/atk-2.22.0.sha256sum
+sha256 d349f5ca4974c9c76a4963e5b254720523b0c78672cbc0e1a3475dbd9b3d44b6 atk-2.22.0.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 663d13a..90d329a 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.20
+ATK_VERSION_MAJOR = 2.22
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-- 
2.7.3
