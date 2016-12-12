From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 21:17:42 +0100
Subject: [Buildroot] [git commit] nano: bump to version 2.7.2
Message-ID: <20161212202944.184E4817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a39b269ea20f48ad6536ab969a9889907cd8ce43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index cb411b7..d1814ae 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 df5cbe69831d7394c0a32fb27373ab313335ea4dc586d6f4be4081eb1de857cd  nano-2.7.1.tar.xz
+sha256 77016f73c686857ce8a3ec217832febb6e636122762d47ce3c6cbef6f7e390c2  nano-2.7.2.tar.xz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 88e3cdb..7f80554 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.7
-NANO_VERSION = $(NANO_VERSION_MAJOR).1
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPLv3+
