From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Oct 2019 20:00:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/nano: bump version to 4.5
Message-ID: <20191021180011.18519-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2019-10/msg00001.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 94a20b9bb7..4e967b79c3 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v4/nano-4.4.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.5.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 2af222e0354848ffaa3af31b5cd0a77917e9cb7742cd073d762f3c32f0f582c7  nano-4.4.tar.xz
+sha256 ded5c38f5ecd9de2b624e0db8013a375c169d3fbbd49575967b868847df8f533  nano-4.5.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index b36048c8db..7817cd4187 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 4
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION = $(NANO_VERSION_MAJOR).5
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.20.1
