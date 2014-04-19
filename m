From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:51:33 +0200
Subject: [Buildroot] [git commit] cosmo: bump to version 14.03.04
Message-ID: <20140419215315.CA9AD9C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7ab6c28212586f065eb12dca275a82e14a6eee7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cosmo/cosmo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cosmo/cosmo.mk b/package/cosmo/cosmo.mk
index 2592f62..0ab5324 100644
--- a/package/cosmo/cosmo.mk
+++ b/package/cosmo/cosmo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COSMO_VERSION = 13.01.30-1
+COSMO_VERSION = 14.03.04-1
 COSMO_LICENSE = MIT
 
 $(eval $(luarocks-package))
