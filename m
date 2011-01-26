From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 11:08:34 +0100
Subject: [Buildroot] [git commit master 1/1] lvm2: use official release
	location as arranged with upstream
Message-ID: <20110126100920.E0E438D21D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eb52900f27d65384ebc5a570c3c623c5be48e8e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://www.redhat.com/archives/lvm-devel/2011-January/msg00002.html
for details.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lvm2/lvm2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9755392..2e9f2d8 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -5,7 +5,7 @@
 #############################################################
 LVM2_VERSION = 2.02.79
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
-LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
+LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
 
 LVM2_BINS = \
-- 
1.7.3.4
