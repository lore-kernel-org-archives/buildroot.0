From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:50:51 +0200
Subject: [Buildroot] [git commit] tovid: change from SVN to github
Message-ID: <20150409195058.626E7818EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6ee0fff287ad0efd8c246379796a4b8629751a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New download information for tovid plus hash file

Signed-off-by: Steve Kenton <skenton@ou.edu>
Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tovid/tovid.hash |    2 ++
 package/tovid/tovid.mk   |    5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

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
