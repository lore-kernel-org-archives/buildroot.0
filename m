From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] Makefile.in: remove now-unused
	TARGET_CC/CXX_NOCCACHE
Message-ID: <20151004162325.3DBC281DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b356105f0b44bc8d7af0987d572afde539efd35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4b1ce7f..7dc0eac 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -186,9 +186,6 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
-TARGET_CC_NOCCACHE  := $(TARGET_CC)
-TARGET_CXX_NOCCACHE := $(TARGET_CXX)
-
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 STRIP_STRIP_UNNEEDED := --strip-unneeded
