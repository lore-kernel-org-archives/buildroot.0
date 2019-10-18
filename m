From: Mauro Condarelli <mc5686@mclink.it>
Date: Fri, 18 Oct 2019 14:50:15 +0200
Subject: [Buildroot] [PATCH v2] package/mc: bump version to 4.8.23
In-Reply-To: <20191015231943.6814-1-mc5686@mclink.it>
References: <20191015231943.6814-1-mc5686@mclink.it>
Message-ID: <20191018125015.20372-1-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index d980b8a473..963b2ad2f9 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.20.sha256:
-sha256  017ee7f4f8ae420a04f4d6fcebaabe5b494661075c75442c76e9c8b1923d501c  mc-4.8.20.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.23.sha256:
+sha256 dd7f7ce74183307b0df25b5c3e60ad3293fd3d3d27d2f37dd7a10efce13dff1c  mc-4.8.23.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index a83c5f0ab8..24f6ac36ac 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.20
+MC_VERSION = 4.8.23
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.23.0
