From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  9 Apr 2020 19:00:14 +0300
Subject: [Buildroot] [PATCH] package/uftp: bump to version 4.10.2
In-Reply-To: <20200409160014.18401-1-asafka7@gmail.com>
References: <20200409160014.18401-1-asafka7@gmail.com>
Message-ID: <20200409160014.18401-6-asafka7@gmail.com>
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
index 1497430011..1e50d1d78a 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256	91ba8aae80c7c9ccaf04600b628cbeca4699ed48268fe43d2bf539a41083f292	uftp-4.10.tar.gz
+sha256	ecab6ab07fe0ebaf7bfe35d99fe2da28ede3ddc6f21f825d3b259cf171258505	uftp-4.10.2.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index cfef1f9e32..e1369da52b 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 4.10
+UFTP_VERSION = 4.10.2
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
-- 
2.26.0
