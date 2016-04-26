From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Apr 2016 10:36:54 +0300
Subject: [Buildroot] [PATCH 2/3] c-icap-modules: bump to version 0.4.2
In-Reply-To: <24318128fb13b0eb0c7ee751441e2fb644139ed0.1461656215.git.baruch@tkos.co.il>
References: <24318128fb13b0eb0c7ee751441e2fb644139ed0.1461656215.git.baruch@tkos.co.il>
Message-ID: <90b9d6716ed5c9f420e59c71c4e27c91331fe462.1461656215.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/c-icap-modules/c-icap-modules.hash | 6 +++---
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index cf325ecddd5e..5df14498711e 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.3.x/
-md5	25a904f98cddbcc7431b22720cd3996e	c_icap_modules-0.3.2.tar.gz
-sha1	98dd7b3bf40b8831e297ffa8c4e1eaf7cef57cd0	c_icap_modules-0.3.2.tar.gz
+# From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.4.x/
+md5	5acd9487679ed47fbee00270d436718d	c_icap_modules-0.4.2.tar.gz
+sha1	e5f4203980b732b9de165c1e83c4703734c3e0e2	c_icap_modules-0.4.2.tar.gz
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index 5252a8106c1a..cf388aaabcc5 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.3.2
+C_ICAP_MODULES_VERSION = 0.4.2
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPLv2+
-- 
2.8.0.rc3
