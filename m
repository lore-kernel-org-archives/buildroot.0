From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:57:04 +0200
Subject: [Buildroot] [git commit] pcmanfm: bump to version 1.2.4
Message-ID: <20160723150127.A968980089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aa4c7eef6d11c9ac8dbd22e196c5830fe2546e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/pcmanfm.hash | 5 +++--
 package/pcmanfm/pcmanfm.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
index a3b7653..cb0d206 100644
--- a/package/pcmanfm/pcmanfm.hash
+++ b/package/pcmanfm/pcmanfm.hash
@@ -1,2 +1,3 @@
-# From http://blog.lxde.org/?p=1280
-sha1  0a195301de31c82f1c169e620be7cea8b91813b5  pcmanfm-1.2.3.tar.xz
+# From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/
+md5	19764c2f59653724c8713e0064fa6829	pcmanfm-1.2.4.tar.xz
+sha1	4768ee564a36021977e4af8c33270b6835b3391d	pcmanfm-1.2.4.tar.xz
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 62d8618..2f5fa47 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 1.2.3
+PCMANFM_VERSION = 1.2.4
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libgtk2 libglib2 menu-cache libfm
