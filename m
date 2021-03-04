From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:13:58 +0100
Subject: [Buildroot] [git commit] package/rsync: add RSYNC_CPE_ID_VENDOR
Message-ID: <20210304065255.3DE4386DAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20dbc17704b181c686761d6d24a3c120d7ef7857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:samba:rsync is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asamba%3Arsync

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 52875e428a..db26ebd93a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -8,6 +8,7 @@ RSYNC_VERSION = 3.1.3
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+
 RSYNC_LICENSE_FILES = COPYING
+RSYNC_CPE_ID_VENDOR = samba
 RSYNC_DEPENDENCIES = zlib popt
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
