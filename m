From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 11:55:33 +0200
Subject: [Buildroot] [git commit branch/next] musl: bump to version 1.1.1
Message-ID: <20140522095750.BE2FD9CD33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c7e38c657a5a3fe1e06b5e906c94111929c4fde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index c3e868d..b5d6c56 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.0
+MUSL_VERSION = 1.1.1
 MUSL_SITE = http://www.musl-libc.org/releases/
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
