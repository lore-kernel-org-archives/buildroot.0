From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:30:42 +0100
Subject: [Buildroot] [git commit] package/spdlog: bump to version 1.8.2
Message-ID: <20210130102238.16C6F83D98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62f9d440abdfeecb4c7aa4e87b088162f50eb1cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index abb8bf9bdd..da1e0c27a0 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5197b3147cfcfaa67dd564db7b878e4a4b3d9f3443801722b3915cdeced656cb  spdlog-1.8.1.tar.gz
+sha256  e20e6bd8f57e866eaf25a5417f0a38a116e537f1a77ac7b5409ca2b180cec0d5  spdlog-1.8.2.tar.gz
 sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index f5b331526a..caf30be6d0 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.8.1
+SPDLOG_VERSION = 1.8.2
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
