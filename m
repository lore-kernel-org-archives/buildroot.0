From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:16:56 +0200
Subject: [Buildroot] [git commit] package/spdlog: bump to version 1.4.2
Message-ID: <20191018191756.42295826B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5d9665b4e676b2102429e3e551fae4730e2e00d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index a77658eacb..0eb5bee491 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3291958eb54ed942d1bd3aef1b4f8ccf70566cbc04d34296ec61eb96ceb73cff  spdlog-1.4.1.tar.gz
+sha256 821c85b120ad15d87ca2bc44185fa9091409777c756029125a02f81354072157  spdlog-1.4.2.tar.gz
 sha256 7d40b1967fca203d22b0eaf75f54566167ded823863abedf4de869fcea057038  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 8cd41776b5..315c4ee407 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.4.1
+SPDLOG_VERSION = 1.4.2
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
