From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 13:20:18 +0200
Subject: [Buildroot] [git commit] acl: bump to version 2.2.52
Message-ID: <20130602212100.46EA89A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2296afed5bf433836b17491aca474622aa9f5420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/acl/acl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index e7a654c..f2b2828 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ACL_VERSION = 2.2.51
+ACL_VERSION = 2.2.52
 ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
