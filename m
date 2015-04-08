From: Steve Kenton <skenton@ou.edu>
Date: Wed,  8 Apr 2015 18:15:58 -0500
Subject: [Buildroot] [PATCH 1/1] tovid: change from SVN to github
Message-ID: <1428534958-5528-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New download information for tovid plus hash file

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
 package/tovid/tovid.hash | 2 ++
 package/tovid/tovid.mk   | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 package/tovid/tovid.hash

diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
new file mode 100644
index 0000000..9ddd750
--- /dev/null
+++ b/package/tovid/tovid.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
index cc2edd9..3069d67 100644
--- a/package/tovid/tovid.mk
+++ b/package/tovid/tovid.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
-TOVID_SITE_METHOD = svn
-TOVID_VERSION = 3534
+TOVID_VERSION = 0.35.0
+TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/v$(TOVID_VERSION)
 TOVID_LICENSE = GPLv2+
 TOVID_LICENSE_FILES = COPYING
 TOVID_SETUP_TYPE = distutils
-- 
2.1.0
