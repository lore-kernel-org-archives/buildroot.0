From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Fri, 19 Aug 2016 22:45:04 +0530
Subject: [Buildroot] [PATCH v2 next 2/2] logrotate: bump version to 3.10.0
In-Reply-To: <1471626904-29215-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471626904-29215-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1471626904-29215-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Changes v1 -> v2:
  - Rebase on top of next branch. (Suggested by Thomas Petazzoni)
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 77d4dc8..ee31f8e 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2de00c65e23fa9d7909cae6594e550b9abe9a7eb1553669ddeaca92d30f97009 logrotate-3.9.2.tar.gz
+sha256 db63b5932190cba941357c029b595a7fddf43539943aa1e0ca53a96136e4c5d9 logrotate-3.10.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index de4d837..96012c0 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.9.2
+LOGROTATE_VERSION = 3.10.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.6.2
