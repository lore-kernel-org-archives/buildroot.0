From: Derycke, Johan <johan.derycke@barco.com>
Date: Wed, 26 Feb 2014 10:04:16 +0000
Subject: [Buildroot] [PATCH] monit: bump to version 5.7
Message-ID: <E1CF8EFE2042404B87DE2B6D662128020ED58658@KUUMEX10.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CHANGES version 5.7:
https://mmonit.com/monit/dist/CHANGES.txt

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
 package/monit/monit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index ec7c95d..3fdc17e 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-MONIT_VERSION = 5.6
+MONIT_VERSION = 5.7
 MONIT_SITE = http://mmonit.com/monit/dist/
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
--
1.7.10.4
This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
