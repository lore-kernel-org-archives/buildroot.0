From: James Knight <james.d.knight@live.com>
Date: Thu, 16 Jun 2016 02:06:08 -0400
Subject: [Buildroot] [PATCH 1/1] logrotate: bump to version 3.9.2
Message-ID: <BLU436-SMTP1791396907EF5364CDBA2A7A0560@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aside from the version number increase, the package has now moved to
GitHub.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index ef537a9..77d4dc8 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 700ed7ce9072a1cca324779a74797dfaefdae37ac50a817134b947c4ded1dfa7 logrotate-3.8.9.tar.gz
+sha256 2de00c65e23fa9d7909cae6594e550b9abe9a7eb1553669ddeaca92d30f97009 logrotate-3.9.2.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 4a70040..de4d837 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.8.9
-LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
+LOGROTATE_VERSION = 3.9.2
+LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
-- 
2.8.1.windows.1
