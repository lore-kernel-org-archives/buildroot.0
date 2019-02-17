From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Feb 2019 17:29:15 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ipmiutil: bump to version 3.1.3
Message-ID: <20190217162915.21455-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.hash | 6 +++---
 package/ipmiutil/ipmiutil.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index e09511f96f..3f89b9049c 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5 ee90387f8a14dea3f867167865c7c968  ipmiutil-3.1.2.tar.gz
-sha1 9453db110bffab3111d6ff4047243a34084e5878  ipmiutil-3.1.2.tar.gz
+md5 0d448d14726e2fda0eb9451fb2866a5c  ipmiutil-3.1.3.tar.gz
+sha1 d20cb3194f4c5cb8c9fd64b3693d5b53dc9510d4  ipmiutil-3.1.3.tar.gz
 # Locally computed
-sha256 768053b3e3adfe1bf656e2848b2805ede87e429c10d282929a7c4ceeebc24703  ipmiutil-3.1.2.tar.gz
+sha256 b80303b6f05cbe48e728dd925fef201e9604a90cd3fc9c8af113367e8d6dbe57  ipmiutil-3.1.3.tar.gz
 sha256 7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 0d9a4509b3..9633914e11 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.2
+IPMIUTIL_VERSION = 3.1.3
 IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
-- 
2.14.1
