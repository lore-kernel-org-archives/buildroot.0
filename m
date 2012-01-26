From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:19:11 +0100
Subject: [Buildroot] [git commit] ntp: bump to version 4.2.6p5
Message-ID: <20120126212541.F07139058F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d7a5607197921ac1c84c889e002b4f36c2040e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
