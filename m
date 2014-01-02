From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  2 Jan 2014 13:53:03 +0200
Subject: [Buildroot] [PATCH] uclibc: snapshot: add BSD obsolete signal
	functions
Message-ID: <1797e4d78b86649e8a9d5aa44cef8fd83b81825f.1388663583.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/70b/70b79ca0aa97ed451a5679029955ed3709c84b67/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uclibc/uClibc-snapshot.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 9ca3f9ea983d..890aefd8ec59 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -152,7 +152,7 @@ UCLIBC_LINUX_SPECIFIC=y
 UCLIBC_HAS_GNU_ERROR=y
 UCLIBC_BSD_SPECIFIC=y
 UCLIBC_HAS_BSD_ERR=y
-# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
+UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
 # UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
 # UCLIBC_NTP_LEGACY is not set
 # UCLIBC_SV4_DEPRECATED is not set
-- 
1.8.5.2
