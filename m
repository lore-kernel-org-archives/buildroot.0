From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 22:37:46 +0200
Subject: [Buildroot] [git commit] cifs-utils: bump version
Message-ID: <20110926204531.F20328DA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4353fec6d7e5f6ab607af4fc897a02eeca637f85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cifs-utils/cifs-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index dfb853a..bc800a6 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,4 +1,4 @@
-CIFS_UTILS_VERSION = 5.0
+CIFS_UTILS_VERSION = 5.1
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
 
