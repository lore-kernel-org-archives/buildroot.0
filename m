From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 23:29:08 +0200
Subject: [Buildroot] [git commit] CHANGES: GDB 4.7.1, not GCC
Message-ID: <20120503212947.0D46696C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa96b4ea99b362decc524a8632c7a2c1a7586e83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Gustavoz noticing on IRC.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0a20bbb..7fd8864 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 	default to uClibc 0.9.33.x, enable
 	UCLIBC_SUPPORT_AI_ADDRCONFIG by default, static and 64bit
 	fixes for external toolchains, linaro ext toolchains, new
-	sourcery codebench ext toolchains, GCC 7.4.1.
+	sourcery codebench ext toolchains, GDB 7.4.1.
 
 	Bootloaders: U-Boot: add 2012.04.01. Barebox: add 2012.04,
 	remove 2011.12.
