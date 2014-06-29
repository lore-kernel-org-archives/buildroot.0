From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:38:41 +0200
Subject: [Buildroot] [git commit] opkg: bump to version 0.2.2 and update
	upstream url
Message-ID: <20140629084016.D76549BBA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=334c6ab7f1d8acfcda8b70ffe970c5fb62baaaf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/opkg.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index c57bd7f..883ef64 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.2.0
-OPKG_SOURCE = $(OPKG_VERSION).tar.bz2
-OPKG_SITE = https://bitbucket.org/opkg/opkg/get
+OPKG_VERSION = v0.2.2
+OPKG_SITE = http://git.yoctoproject.org/git/opkg
+OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
 OPKG_DEPENDENCIES = host-pkgconf
 OPKG_LICENSE = GPLv2+
