From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 11 Dec 2018 13:24:58 -0600
Subject: [Buildroot] [PATCH v1 1/1] package/swupdate: Update to version
 2018.11
Message-ID: <20181211192458.26400-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to version 2018.11 to resolve build errors due to the changes
in libcurl at version 7.62.0

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index efc637976a..7b49337ffd 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  19156bb30c3517a0ff9c918a38062df3cfa70f02f8162da4971a2f47d108688e  swupdate-2018.03.tar.gz
+sha256  a65884ca18523cde1b0744d952d6f91462dbd4ad07941305f5684c6d4ec833dc  swupdate-2018.11.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index abf46c9256..6285437aaa 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2018.03
+SWUPDATE_VERSION = 2018.11
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = COPYING
-- 
2.18.0
