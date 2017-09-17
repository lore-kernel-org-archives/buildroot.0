From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:36:39 +0200
Subject: [Buildroot] [git commit] package/pcmanfm: bump version to 1.2.5
Message-ID: <20170917162918.3B81F80432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47416d9189d476bee31e66c1e6c9a619d09765fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/pcmanfm.hash | 4 ++--
 package/pcmanfm/pcmanfm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.hash b/package/pcmanfm/pcmanfm.hash
index cb0d206..155e9be 100644
--- a/package/pcmanfm/pcmanfm.hash
+++ b/package/pcmanfm/pcmanfm.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/
-md5	19764c2f59653724c8713e0064fa6829	pcmanfm-1.2.4.tar.xz
-sha1	4768ee564a36021977e4af8c33270b6835b3391d	pcmanfm-1.2.4.tar.xz
+md5 b4d1f8ce08d87e4f27805a246fc51ac2  pcmanfm-1.2.5.tar.xz
+sha1 9a8a2b4abebdf859e5ba2486eff84d505ad17b89  pcmanfm-1.2.5.tar.xz
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index e173436..31acae6 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCMANFM_VERSION = 1.2.4
+PCMANFM_VERSION = 1.2.5
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.xz
 PCMANFM_SITE = http://sourceforge.net/projects/pcmanfm/files
 PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm
