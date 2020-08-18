From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:45:59 +0200
Subject: [Buildroot] [git commit branch/next] package/gensio: bump to
 version 2.1.4
Message-ID: <20200818144024.A00D1868CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e63410165ced1b7db867eae613f9b3b70350d146
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 067c9d39cc..b83f21abd0 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  1281387def2b137f762ce4a8869fbb4f  gensio-2.1.1.tar.gz
-sha1  4fb43270449e1f2312be87e56aff8173d285e3f1  gensio-2.1.1.tar.gz
+md5  e2547078bd73d62abda343515f1368ee  gensio-2.1.4.tar.gz
+sha1  f8c0e787fad22a71b10f1d8eefea83617f489bdb  gensio-2.1.4.tar.gz
 # Locally computed:
-sha256  e81df2c55d8830ac4f3c28eda54c3f690c4b62e186ea3879815b101a4902a703  gensio-2.1.1.tar.gz
+sha256  1f5a29aabfb35886893cfda5cd78192db67e96de796dbf9758dbecd4077a3fd8  gensio-2.1.4.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 7cdd340b14..89b7be9cdc 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.1.1
+GENSIO_VERSION = 2.1.4
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
