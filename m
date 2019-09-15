From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:18:51 +0200
Subject: [Buildroot] [git commit] package/slang: bump to version 2.3.2
Message-ID: <20190915141603.7C4088E44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d9c3b0807e5f43aa0e34b3842596d8ed7d6e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/slang/slang.hash | 4 ++--
 package/slang/slang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/slang/slang.hash b/package/slang/slang.hash
index bd806e8a4d..faa34c8207 100644
--- a/package/slang/slang.hash
+++ b/package/slang/slang.hash
@@ -1,6 +1,6 @@
 # sha1 from http://www.jedsoft.org/releases/slang/, sha256 locally computed
-sha1 a8ea7f1b5736160a94efb67b137a0f5b9916bdf2  slang-2.3.1a.tar.bz2
-sha256 54f0c3007fde918039c058965dffdfd6c5aec0bad0f4227192cc486021f08c36  slang-2.3.1a.tar.bz2
+sha1 bbf7f2dcc14e7c7fca40868fd4b411a2bd9e2655 slang-2.3.2.tar.bz2
+sha256 fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a slang-2.3.2.tar.bz2
 
 # License file, locally computed
 sha256 ff05a90962e7773f8bdc47b2a9585130526039102759b524c1dffbd57cfe469b  COPYING
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index d0c0e76322..44a0148088 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLANG_VERSION = 2.3.1a
+SLANG_VERSION = 2.3.2
 SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
 SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPL-2.0+
