From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  3 Sep 2019 13:38:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/nano: bump to version 4.4
Message-ID: <20190903113837.27400-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 8b0bb60c0a..94a20b9bb7 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v4/nano-4.3.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.4.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 00d3ad1a287a85b4bf83e5f06cedd0a9f880413682bebd52b4b1e2af8cfc0d81  nano-4.3.tar.xz
+sha256 2af222e0354848ffaa3af31b5cd0a77917e9cb7742cd073d762f3c32f0f582c7  nano-4.4.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 25d17a8fd1..b36048c8db 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 4
-NANO_VERSION = $(NANO_VERSION_MAJOR).3
+NANO_VERSION = $(NANO_VERSION_MAJOR).4
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.21.0
