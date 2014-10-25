From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:26:06 +0200
Subject: [Buildroot] [git commit] package/ccid: bump to 1.4.18,
	move download URL to snapshot.debian.org
Message-ID: <20141025095905.6E082B13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa940483f29e1ec07e6436d91688eef51aade886
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccid/ccid.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index b635aa1..18653d3 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.14
-CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/file/3971
+CCID_VERSION = 1.4.18
+CCID_SOURCE = ccid_$(CCID_VERSION).orig.tar.bz2
+CCID_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ccid
 CCID_LICENSE = LGPLv2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
