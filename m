From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:24:54 +0200
Subject: [Buildroot] [git commit] package/newt: bump version to 0.52.20
Message-ID: <20170922212108.413B98104F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d54f5b6c5fb7e719b6fde926db7962d83fe1d989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newt/newt.hash | 2 +-
 package/newt/newt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index fe5870b..b6fd317 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	08c0db56c21996af6a7cbab99491b774c6c09cef91cd9b03903c84634bff2e80  newt-0.52.19.tar.gz
+sha256 8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5adbb6dbc  newt-0.52.20.tar.gz
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 456dd69..b6d973a 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.19
+NEWT_VERSION = 0.52.20
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
