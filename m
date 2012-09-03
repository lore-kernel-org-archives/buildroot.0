From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:38 -0000
Subject: [Buildroot] [git commit] opkg: bump version to svn r635
Message-ID: <20120903200537.35A899953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80cde682b1f3a794e173efd82a347d5bab658730
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is recommended to use the most recent revision from subversion as it
contains various fixes.

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/opkg.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index be67f8e..3ba61ae 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-OPKG_VERSION = 0.1.8
+OPKG_VERSION = 635
 OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
-OPKG_SITE = http://opkg.googlecode.com/files
+OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
+OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPT = --disable-curl --disable-gpg
+OPKG_AUTORECONF = YES
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
