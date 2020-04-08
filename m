From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 16:53:23 +0200
Subject: [Buildroot] [git commit] package/nano: bump to v4.9.2
Message-ID: <20200408150721.C63278E003@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e78684e4338487e66b126d69af619cc5143c9e52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update the hash file to the new two-spaces convention

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 6 +++---
 package/nano/nano.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 965a94aa0b..9193a8af32 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v4/nano-4.7.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.9.2.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 58c0e197de5339ca3cad3ef42b65626d612ddb0b270e730f02e6ab3785c736f5  nano-4.7.tar.xz
-sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
+sha256  d8a25eea942ecee2d57b8e037eb4b28f030f818b78773b8fcb994ed5835d2ef6  nano-4.9.2.tar.xz
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 5cb8d1d5c0..3b7ccf1129 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 4
-NANO_VERSION = $(NANO_VERSION_MAJOR).7
+NANO_VERSION = $(NANO_VERSION_MAJOR).9.2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
