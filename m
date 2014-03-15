From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 21:14:46 +0100
Subject: [Buildroot] [git commit] slang: add license info
Message-ID: <20140315202727.834649BFF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=595194535ac740930ec43ca6a20d9cb8a85bf787
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slang/slang.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index c66971e..d519eca 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -8,6 +8,8 @@ SLANG_VERSION_MAJOR = 2.2
 SLANG_VERSION = $(SLANG_VERSION_MAJOR).4
 SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
 SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v$(SLANG_VERSION_MAJOR)/
+SLANG_LICENSE = GPLv2+
+SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_MAKE = $(MAKE1)
 
