From: Michael Fischer <mf@go-sys.de>
Date: Mon, 3 Feb 2020 14:48:22 +0000
Subject: [Buildroot] [PATCH ] package/sdl2: SDL2 2.0.09 to Version 2.0.10
Message-ID: <1270bd947c2e436e940d0a07f7f7e5a0@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 0668883f06..aaa756e898 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,6 @@
# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.9.tar.gz.sig
sha256 255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1  SDL2-2.0.9.tar.gz
+sha256 b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57  SDL2-2.0.10.tar.gz
+
# Locally calculated
sha256 61e627031e1160bf8b9bdbc9cda27656d422ea8eaab199b64b4a4a4168437154  COPYING.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index d2fba9d810..e39c51d4d9 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
#
################################################################################
-SDL2_VERSION = 2.0.9
+SDL2_VERSION = 2.0.10
SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
SDL2_SITE = http://www.libsdl.org/release
SDL2_LICENSE = Zlib
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200203/196b41ba/attachment.html>
