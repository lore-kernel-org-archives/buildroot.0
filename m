From: Chris Packham <judge.packham@gmail.com>
Date: Thu,  8 Sep 2016 22:01:18 +1200
Subject: [Buildroot] [PATCH 2/2] syslog-ng: Bump version to 3.7.3
In-Reply-To: <20160908100118.5723-1-judge.packham@gmail.com>
References: <20160908100118.5723-1-judge.packham@gmail.com>
Message-ID: <20160908100118.5723-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 0213d2d..f1dcf52 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b1b3ccc0ce7f0d8bf15b23e59f2f4f5ded70eed410dfd27105219bc8856388a5  syslog-ng-3.7.2.tar.gz
+sha256 49201dcfd59c8992936aa16c694f5e6593d505b44895f6c66b7d7f7895ce2c62  syslog-ng-3.7.3.tar.gz
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 7e4d407..b4fc24b 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLOG_NG_VERSION = 3.7.2
+SYSLOG_NG_VERSION = 3.7.3
 SYSLOG_NG_SOURCE = syslog-ng-$(SYSLOG_NG_VERSION).tar.gz
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
-- 
2.9.2.518.ged577c6.dirty
