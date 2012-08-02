From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:53:45 -0000
Subject: [Buildroot] [git commit branch/next] cifs-utils: bump to version 5.5
Message-ID: <20120802195250.3CD8496FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9c3890cdd22f168bdc3cb52926d51ba2a2b61b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump cifs-utils to version 5.5
Also switch to http source instead of ftp.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cifs-utils/cifs-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 0fdb689..15ed17a 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,6 +1,6 @@
-CIFS_UTILS_VERSION = 5.4
+CIFS_UTILS_VERSION = 5.5
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
-CIFS_UTILS_SITE    = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
+CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
