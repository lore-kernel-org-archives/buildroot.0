From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 18 May 2020 01:37:12 -0600
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.0.5
Message-ID: <20200518073712.1415646-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index c9da6f3cdc..286d776713 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  76466adbd15aae9d0af7207a921935b5  gensio-2.0.3.tar.gz
-sha1  da14b4903e8422745dd6193b41385ad2e1bd1fff  gensio-2.0.3.tar.gz
+md5  ffecba5ab1d6a7514733ca7f2efe8de4  gensio-2.0.5.tar.gz
+sha1  92dcc410049394a9c5a4dcde7062b4d525be99ee  gensio-2.0.5.tar.gz
 # Locally computed:
-sha256  f19cfcef8187a01b0168931c2b80d065c8bba6004e06fab62745ca512374d706  gensio-2.0.3.tar.gz
+sha256  c53c0280e3fae3218611c5d5e7d6ee62ed86a2e791546fbf6f1e770c9a98c3c7  gensio-2.0.5.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 17388ad3c6..3948989c97 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.0.3
+GENSIO_VERSION = 2.0.5
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.25.1
