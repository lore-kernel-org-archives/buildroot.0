From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 21:58:27 +0100
Subject: [Buildroot] [git commit] radvd: bump to version 1.9.8
Message-ID: <20140128210416.0EB679C6AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f5906324aa2e8e9476de341bf30a098fcba0005
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 22ab9f9..9057a08 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.9.7
+RADVD_VERSION = 1.9.8
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
