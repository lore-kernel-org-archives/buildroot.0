From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 09:11:30 +0100
Subject: [Buildroot] [PATCH] ntp: add license information
Message-ID: <505043B2.9030502@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/ntp/ntp.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 504ede7..a9a7f10 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -6,6 +6,8 @@

 NTP_VERSION = 4.2.6p5
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
+NTP_LICENSE = ntp license
+NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no

 ifneq ($(BR2_INET_IPV6),y)
-- 
1.7.9.5
