From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jun 2010 11:48:58 +0200
Subject: [Buildroot] [git commit master 1/1] uClibc: 0.9.31.config: enable
	UCLIBC_SV4_DEPRECATED option
Message-ID: <20100618114218.78624816CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1e627bf212afff670e414d3ebfc8fb4c4b31c318
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by xfsprogs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.31.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 87f2411..04d6895 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -119,7 +119,7 @@ UCLIBC_HAS_BSD_ERR=y
 # UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
 # UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
 # UCLIBC_NTP_LEGACY is not set
-# UCLIBC_SV4_DEPRECATED is not set
+UCLIBC_SV4_DEPRECATED=y
 UCLIBC_HAS_REALTIME=y
 UCLIBC_HAS_ADVANCED_REALTIME=y
 UCLIBC_HAS_EPOLL=y
-- 
1.7.1
