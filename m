From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:10:47 +0100
Subject: [Buildroot] [git commit] radvd: bump version to 1.8.5
Message-ID: <20120311222556.ED6A790D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=572fc1351eac9202d76a56707aedae9bc8eb5f26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index d4b9a73..e63e8e0 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.8.3
-RADVD_SITE = http://www.litech.org/radvd/dist/
+RADVD_VERSION = 1.8.5
+RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = flex host-flex
 
 define RADVD_INSTALL_INITSCRIPT
