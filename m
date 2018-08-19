From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 11:06:59 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ipmiutil: bump version to 3.1.2
Message-ID: <20180819090659.14684-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added md5 hash provided by upstream and license hash, switched _SITE to
https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ipmiutil/ipmiutil.hash | 8 +++++---
 package/ipmiutil/ipmiutil.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index f9d086b67a..e09511f96f 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,4 +1,6 @@
-# From http://sourceforge.net/projects/ipmiutil/files/?source=navbar
-sha1	f423a77a374b6a37a16496844f1e6e363e7d63fe	ipmiutil-2.9.9.tar.gz
+# From https://sourceforge.net/projects/ipmiutil/files/
+md5 ee90387f8a14dea3f867167865c7c968  ipmiutil-3.1.2.tar.gz
+sha1 9453db110bffab3111d6ff4047243a34084e5878  ipmiutil-3.1.2.tar.gz
 # Locally computed
-sha256	beace08386a002c6a4bbbf894bda9899ea34fae4c2181c89f29fb1fa136925f6	ipmiutil-2.9.9.tar.gz
+sha256 768053b3e3adfe1bf656e2848b2805ede87e429c10d282929a7c4ceeebc24703  ipmiutil-3.1.2.tar.gz
+sha256 7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index a5a6b49314..5d8c45665d 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 2.9.9
-IPMIUTIL_SITE = http://sourceforge.net/projects/ipmiutil/files
+IPMIUTIL_VERSION = 3.1.2
+IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac
-- 
2.18.0
