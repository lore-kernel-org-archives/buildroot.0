From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:27:27 +0200
Subject: [Buildroot] [git commit] cifs-utils: correct license GPLv3 -> GPLv3+
Message-ID: <20131009194411.63C7E9B99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9907e48044f7e8b0923c2ade68b88e3e36aa00d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cifs-utils/cifs-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index ae80531..f715e36 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -7,7 +7,7 @@
 CIFS_UTILS_VERSION = 6.1
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
-CIFS_UTILS_LICENSE = GPLv3
+CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
 define CIFS_UTILS_NO_WERROR
