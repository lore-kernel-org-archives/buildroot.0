From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Jun 2020 21:46:30 +0300
Subject: [Buildroot] [PATCH 1/1] package/spdlog: bump to version 1.6.1
In-Reply-To: <20200615184632.493821-1-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
Message-ID: <20200615184632.493821-6-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License was updated with little rephrasings, typo fixes,
and a note about using fmt as a third party library under the
MIT license.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/spdlog/spdlog.hash | 4 ++--
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 2b51877aa2..d4799f92f3 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b38e0bbef7faac2b82fed550a0c19b0d4e7f6737d5321d4fd8f216b80f8aee8a  spdlog-1.5.0.tar.gz
-sha256 7d40b1967fca203d22b0eaf75f54566167ded823863abedf4de869fcea057038  LICENSE
+sha256 378a040d91f787aec96d269b0c39189f58a6b852e4cbf9150ccfacbe85ebbbfc  spdlog-1.6.1.tar.gz
+sha256 a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index f8eb9bc0f9..49b4bd3acd 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.5.0
+SPDLOG_VERSION = 1.6.1
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.26.2
