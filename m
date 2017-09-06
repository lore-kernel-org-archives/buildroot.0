From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:34:30 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/iostat: fix
	upstream source URL
Message-ID: <20170906112607.DBF8281932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09549cc322d3989fb439a2da4c4407118e588826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3d37cc2c97ddfd89698af121e77e9cebfb085a16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
