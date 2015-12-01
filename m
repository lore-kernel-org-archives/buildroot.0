From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:15 -0000
Subject: [Buildroot] [git commit] libnet: adjust license information
Message-ID: <20151201232114.B3B81821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d33e77f742cc5f9706a6eb4eaeeaabe27315939
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Arnout, some files are under BSD-3c.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnet/libnet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
