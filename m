From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 09:01:10 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: whitespace fixup
	after CPPFLAGS addition
Message-ID: <20121011070543.4614E99835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=635722372249eef15763f4293bc9816e75724ca1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c042984..45213c1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -92,9 +92,8 @@ TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS
 endif
 
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
-
-TARGET_CXXFLAGS  = $(TARGET_CFLAGS)
-TARGET_LDFLAGS   = $(call qstrip,$(BR2_TARGET_LDFLAGS))
+TARGET_CXXFLAGS = $(TARGET_CFLAGS)
+TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
