From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  2 Jul 2020 07:25:47 +0200
Subject: [Buildroot] [PATCH] package/gensio: bump to version 2.1.1
Message-ID: <20200702052547.31769-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index c9da6f3cdc..067c9d39cc 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  76466adbd15aae9d0af7207a921935b5  gensio-2.0.3.tar.gz
-sha1  da14b4903e8422745dd6193b41385ad2e1bd1fff  gensio-2.0.3.tar.gz
+md5  1281387def2b137f762ce4a8869fbb4f  gensio-2.1.1.tar.gz
+sha1  4fb43270449e1f2312be87e56aff8173d285e3f1  gensio-2.1.1.tar.gz
 # Locally computed:
-sha256  f19cfcef8187a01b0168931c2b80d065c8bba6004e06fab62745ca512374d706  gensio-2.0.3.tar.gz
+sha256  e81df2c55d8830ac4f3c28eda54c3f690c4b62e186ea3879815b101a4902a703  gensio-2.1.1.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 17388ad3c6..7cdd340b14 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.0.3
+GENSIO_VERSION = 2.1.1
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.17.0
