From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Apr 2010 11:19:38 +0200
Subject: [Buildroot] [git commit master] Enable libutil by default for
	uclibc 0.9.31
Message-ID: <20100419092015.01FD88DE34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7f01e18e77dd43d535002783e9a40deedd2d924
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1591

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.31.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index a69f5b1..091f179 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -94,7 +94,7 @@ UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
 # UCLIBC_HAS_GETPT is not set
-# UCLIBC_HAS_LIBUTIL is not set
+UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
-- 
1.6.3.3
