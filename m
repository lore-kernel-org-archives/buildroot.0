From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 22:47:03 +0200
Subject: [Buildroot] [git commit] hplip: bump version to 3.17.10
Message-ID: <20171017203944.0C733811B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc8c46931f724701dd6ff6bbf357eb6cafff18ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch | 2 +-
 package/hplip/hplip.hash                                        | 2 +-
 package/hplip/hplip.mk                                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch b/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
index 8147490..db2f0a4 100644
--- a/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
+++ b/package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch
@@ -23,7 +23,7 @@ index 8b06428..680cad5 100755
 @@ -27,8 +27,7 @@
  
  #AC_PREREQ(2.59)
- AC_INIT([HP Linux Imaging and Printing], [3.16.11], [3.16.11], [hplip])
+ AC_INIT([HP Linux Imaging and Printing], [3.17.10], [3.17.10], [hplip])
 -#AM_INIT_AUTOMAKE([1.9 foreign])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([1.9 foreign subdir-objects])
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
index 9dfb7a2..2260850 100644
--- a/package/hplip/hplip.hash
+++ b/package/hplip/hplip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f6e20cacb4891e4e60fc5de2213a10f8d0c68840f9b511aa38cfca0cb29f9b24  hplip-3.16.11.tar.gz
+sha256  0f7344174672f63a98a22f3c109005b6eb89fe738b7d466316bf2c53d083476c  hplip-3.17.10.tar.gz
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index b1c167c..9eac83d 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HPLIP_VERSION = 3.16.11
+HPLIP_VERSION = 3.17.10
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
