From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:28 +0530
Subject: [Buildroot] [PATCH 6/9] ntp: use SPDX short identifier for ntp
	license
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-6-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index e3e53a8..cd6cb16 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -8,7 +8,7 @@ NTP_VERSION_MAJOR = 4.2
 NTP_VERSION = $(NTP_VERSION_MAJOR).8p10
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent openssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-NTP_LICENSE = ntp license
+NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
 NTP_CONF_OPTS = \
-- 
2.7.4
