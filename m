From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Dec 2009 09:51:57 +0100
Subject: [Buildroot] [git commit master] toolchain/uClibc: 0.9.30.x config:
	enable arch specific string routines if available
Message-ID: <20091215085302.E5CC476BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3df830c2bcad37871b6a6f2f34d6f0db106670f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.30.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.30.config b/toolchain/uClibc/uClibc-0.9.30.config
index 30db7fe..c8efe18 100644
--- a/toolchain/uClibc/uClibc-0.9.30.config
+++ b/toolchain/uClibc/uClibc-0.9.30.config
@@ -135,7 +135,7 @@ UCLIBC_USE_NETLINK=y
 # String and Stdio Support
 #
 # UCLIBC_HAS_STRING_GENERIC_OPT is not set
-# UCLIBC_HAS_STRING_ARCH_OPT is not set
+UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
-- 
1.6.3.3
