From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 12:08:22 +0200
Subject: [Buildroot] [PATCH 04/10] atk: bump to 1.33.6
In-Reply-To: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b4ca0d24b67045045dc24a01f839d6e2a59f4eed.1305713253.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 0ac9b77..ad95f99 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -3,8 +3,8 @@
 # atk
 #
 #############################################################
-ATK_VERSION_MAJOR = 1.30
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
+ATK_VERSION_MAJOR = 1.33
+ATK_VERSION = $(ATK_VERSION_MAJOR).6
 ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_INSTALL_STAGING = YES
-- 
1.7.1
