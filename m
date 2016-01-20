From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 17:27:16 +0100
Subject: [Buildroot] [git commit] libjpeg: bump to version 9b
Message-ID: <20160120162809.B210C82807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55d19d9cd7aab39622863d573701ce7b28d2f487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.hash | 2 +-
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 035812a..2ad7dda 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 3a753ea48d917945dd54a2d97de388aa06ca2eb1066cbfdc6652036349fe05a7 jpegsrc.v9a.tar.gz
+sha256	240fd398da741669bf3c90366f58452ea59041cacc741a489b99f2f6a0bad052	jpegsrc.v9b.tar.gz
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index c4190c7..14aba61 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9a
+LIBJPEG_VERSION = 9b
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
