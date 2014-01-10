From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2014 00:09:44 +0100
Subject: [Buildroot] [git commit] uclibc: snapshot: add BSD obsolete signal
	functions
Message-ID: <20140110231044.82F959C43A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70de2d01284e70cfdbc929fbd6a20e113af0c7a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/70b/70b79ca0aa97ed451a5679029955ed3709c84b67/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-snapshot.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 9ca3f9e..890aefd 100644
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
