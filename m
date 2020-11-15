From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 15 Nov 2020 21:56:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/spdlog: bump to version 1.8.1
In-Reply-To: <20201115195654.88212-1-asafka7@gmail.com>
References: <20201115195654.88212-1-asafka7@gmail.com>
Message-ID: <20201115195654.88212-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 68dd7f1978..abb8bf9bdd 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e68e9b40cf63bb022a4b18cdc1c9d88eb5d97e4fd64fa981950a9cacf57a4bf  spdlog-1.8.0.tar.gz
+sha256  5197b3147cfcfaa67dd564db7b878e4a4b3d9f3443801722b3915cdeced656cb  spdlog-1.8.1.tar.gz
 sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 8d8c3888bf..3c745f60ad 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.8.0
+SPDLOG_VERSION = 1.8.1
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.27.0
