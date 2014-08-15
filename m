From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:29:04 +0200
Subject: [Buildroot] [git commit] subversion: security bump to version 1.7.18
Message-ID: <20140815202909.49A829D439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f550bea09aec9c6f0483da4d785b988bf3cf1292
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CVE-2014-0032 - mod_dav_svn is vunerable to a remotely triggerable
segfault DoS vulnerability when SVNListParentPath is on.

CVE-2014-3522 - Serf RA layer does not correctly validate certificates
with wildcards in them for HTTPS.

CVE-2014-3528 - Credentials cached with Subversion may be sent to the
wrong server.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/subversion/subversion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index d7a4b42..e78936a 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.7.14
+SUBVERSION_VERSION = 1.7.18
 SUBVERSION_SITE = http://archive.apache.org/dist/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
