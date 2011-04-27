From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2011 22:13:48 +0200
Subject: [Buildroot] [git commit] toolchain: update uClibc snapshot config
	again to avoid build stalls
Message-ID: <20110427201947.B4F558294E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eac3475c4723e9e37aaaacb42003794dfbcd4184
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update uClibc snapshot version config to avoid build stalls.

This time we take care of the new UCLIBC_HAS_FTS and
UCLIBC_HAS_BACKTRACE options.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-snapshot.config |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index aa00680..34ec0ff 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -220,6 +220,7 @@ UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
+# UCLIBC_HAS_FTS is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 # UCLIBC_HAS_UTMPX is not set
@@ -260,6 +261,7 @@ DOSTRIP=y
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
 # UCLIBC_MALLOC_DEBUGGING is not set
+# UCLIBC_HAS_BACKTRACE is not set
 WARNINGS="-Wall"
 # EXTRA_WARNINGS is not set
 # DOMULTI is not set
-- 
1.7.3.4
