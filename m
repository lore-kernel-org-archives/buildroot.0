From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:47:03 +0100
Subject: [Buildroot] [git commit] libcgroup: also needs host-flex
Message-ID: <20131104211054.7B98E9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd427bbabb4fff62d076db9e57bbd743fa54bf60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b43/b43ef442facd5aa136a77db99e57e02cc7e39a94/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgroup/libcgroup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 339deb3..6d7ae54 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -9,7 +9,7 @@ LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v.038
 LIBCGROUP_LICENSE = LGPLv2.1
 LIBCGROUP_LICENSE_FILES = COPYING
-LIBCGROUP_DEPENDENCIES = host-bison
+LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
