From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Nov 2012 22:30:36 +0100
Subject: [Buildroot] [git commit] ntp: add license information
Message-ID: <20121108213748.690B699C34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c03b907bb770b16e19b2b366a95c3cdedc09d57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntp/ntp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
