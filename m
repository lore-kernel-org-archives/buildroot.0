From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 May 2018 21:33:07 +0200
Subject: [Buildroot] [git commit] libjpeg: bump to version 9c
Message-ID: <20180502193526.0B6248B4AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cb8c0281b83277ff11e983e092ff32e41bba94f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.hash | 3 ++-
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 2ad7dda6cf..7d47f550cb 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256	240fd398da741669bf3c90366f58452ea59041cacc741a489b99f2f6a0bad052	jpegsrc.v9b.tar.gz
+sha256	650250979303a649e21f87b5ccd02672af1ea6954b911342ea491f351ceb7122	jpegsrc.v9c.tar.gz
+sha256	31f366acfb6259456d9046eb7f16875e387f8bf029d37ac4c4397bf63f22fd6b	README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 95663a9e00..edda2a5a1b 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9b
+LIBJPEG_VERSION = 9c
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = jpeg-license (BSD-3-Clause-like)
