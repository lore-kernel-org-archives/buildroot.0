From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:40:39 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/nano: bump
 version to 4.9.3
Message-ID: <20200722114339.D4EE7880BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08ed28c31219f558027cf555dcee44182c3c7af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Release notes: https://www.nano-editor.org/news.php

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f04083836251d774dfacf2c3b1658f905330c16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 9193a8af32..54c8ab591d 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v4/nano-4.9.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.9.3.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  d8a25eea942ecee2d57b8e037eb4b28f030f818b78773b8fcb994ed5835d2ef6  nano-4.9.2.tar.xz
+sha256  6e3438f033a0ed07d3d74c30d0803cbda3d2366ba1601b7bbf9b16ac371f51b4  nano-4.9.3.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 3b7ccf1129..f3dd9fc895 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 4
-NANO_VERSION = $(NANO_VERSION_MAJOR).9.2
+NANO_VERSION = $(NANO_VERSION_MAJOR).9.3
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
