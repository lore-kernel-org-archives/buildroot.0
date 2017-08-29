From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 22:02:38 +0200
Subject: [Buildroot] [git commit] package/iostat: fix upstream source URL
Message-ID: <20170829195701.EB5BD8166E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d37cc2c97ddfd89698af121e77e9cebfb085a16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iostat/iostat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d591c67..4953c73 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IOSTAT_VERSION = 2.2
-IOSTAT_SITE = http://www.linuxinsight.com/files
+IOSTAT_SITE = http://linuxinsight.com/sites/default/files
 IOSTAT_LICENSE = GPL
 IOSTAT_LICENSE_FILES = LICENSE
 
