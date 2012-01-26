From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:21 -0300
Subject: [Buildroot] [PATCH 02/13] ntp: bump to version 4.2.6p5
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/ntp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f17193f..8076ce7 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NTP_VERSION = 4.2.6p4
+NTP_VERSION = 4.2.6p5
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
 
-- 
1.7.3.4
