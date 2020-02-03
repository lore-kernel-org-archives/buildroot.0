From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 17:35:04 +0100
Subject: [Buildroot] [git commit] package/sdl2: bump version to 2.0.10
Message-ID: <20200203162443.E30038896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a08abc2e3dbeb125db792f9e3540c8901b0dc50e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust license hash as the copyright year was changed:
-Copyright (C) 1997-2018 Sam Lantinga <slouken@libsdl.org>
+Copyright (C) 1997-2019 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.hash | 6 +++---
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 0668883f06..9e968e0af5 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.9.tar.gz.sig
-sha256 255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1  SDL2-2.0.9.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.10.tar.gz.sig
+sha256 b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57  SDL2-2.0.10.tar.gz
 # Locally calculated
-sha256 61e627031e1160bf8b9bdbc9cda27656d422ea8eaab199b64b4a4a4168437154  COPYING.txt
+sha256 a7c8d0b3167c502921192585a582eb8477ad9862330f4d8b9e4a8bb4c1a9d29e  COPYING.txt
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
