From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Mar 2014 13:50:00 -0300
Subject: [Buildroot] [PATCH] openswan: security bump to version 2.6.41
Message-ID: <1394643000-30632-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-2037 (continuation of CVE-2013-6466 issues).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index ae055d4..4d82b49 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.40
+OPENSWAN_VERSION = 2.6.41
 OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
-- 
1.8.3.2
