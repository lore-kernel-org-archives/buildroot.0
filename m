From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:02:24 +0100
Subject: [Buildroot] [git commit branch/next] libnet: adjust license
	information
Message-ID: <20151111140244.130E7805F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d33e77f742cc5f9706a6eb4eaeeaabe27315939
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As noticed by Arnout, some files are under BSD-3c.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnet/libnet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index d021f76..3b62a79 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -7,7 +7,7 @@
 LIBNET_VERSION = 1.1.6
 LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
 LIBNET_INSTALL_STAGING = YES
-LIBNET_LICENSE = BSD-2c
+LIBNET_LICENSE = BSD-2c, BSD-3c
 LIBNET_LICENSE_FILES = doc/COPYING
 
 $(eval $(autotools-package))
