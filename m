From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  8 Jun 2019 09:13:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/uftp: bump to version 4.9.11
Message-ID: <20190608061315.7235-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index 57016f2081..a1bdf5b538 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256	c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48	uftp-4.9.9.tar.gz
+sha256	2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a	uftp-4.9.11.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index edf22cf5ce..f217cf3ac8 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 4.9.9
+UFTP_VERSION = 4.9.11
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
