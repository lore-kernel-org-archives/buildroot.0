From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Apr 2013 11:45:26 +0200
Subject: [Buildroot] [git commit] radvd: needs host-bison
Message-ID: <20130410095123.B8BF09B4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1a251e7223c9732ca47d46c836851d3dbbfaa0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/849c48029ba77789f33ff726c5a33cd959200e38/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 2a60729..95bfe07 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -6,7 +6,7 @@
 
 RADVD_VERSION = 1.9.2
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = flex libdaemon host-flex host-pkgconf
+RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
