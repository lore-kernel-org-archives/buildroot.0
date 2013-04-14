From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 20:36:52 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 1.9.3
Message-ID: <20130414184110.CBD4B9B621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc78b5fc6254b674d7d89c27811ba10ae8304e96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 95bfe07..9d1d683 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.9.2
+RADVD_VERSION = 1.9.3
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 RADVD_AUTORECONF = YES
