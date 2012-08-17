From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 17:46:10 +0200
Subject: [Buildroot] [git commit branch/next] cifs-utils: bump to version 5.6
Message-ID: <20120817154924.622F8971EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=839546dd3aaff56f26536ea7373978e32563c473
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cifs-utils/cifs-utils.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index e2530c0..cfa2b91 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,6 +1,8 @@
-CIFS_UTILS_VERSION = 5.5
+CIFS_UTILS_VERSION = 5.6
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
+CIFS_UTILS_LICENSE = GPLv3
+CIFS_UTILS_LICENSE_FILES = COPYING
 
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
