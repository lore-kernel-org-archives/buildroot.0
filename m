From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:28:15 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 1.10.0
Message-ID: <20140330092855.885E29C2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae3dc39b2c32273b57fde09c5c0ece852d006206
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds 6LoWPAN support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index bc782fd..e82774e 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.9.9
+RADVD_VERSION = 1.10.0
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
