From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] autoconf: bump version to 2.65
Message-ID: <20091216153047.898CD77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=169403079a10a783cce02b00ae8adf5509dfc04a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index a94f23e..d82c2c5 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.64
+AUTOCONF_VERSION = 2.65
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
1.6.3.3
