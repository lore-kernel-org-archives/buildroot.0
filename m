From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 18:31:51 +0200
Subject: [Buildroot] [git commit] package/nano: bump version to 4.3
Message-ID: <20190801162912.3DCCD88DAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29ee5bb352bc56dc4921d8952e0a72fc0bef54b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2019-06/msg00004.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index b7fd6a6cfd..8b0bb60c0a 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v4/nano-4.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.3.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 1143defce62e391b241252ffdb6e5c1ded56cfe26d46ee81b796abe0ccc45df9  nano-4.2.tar.xz
+sha256 00d3ad1a287a85b4bf83e5f06cedd0a9f880413682bebd52b4b1e2af8cfc0d81  nano-4.3.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 8a315154d2..25d17a8fd1 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 4
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).3
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
