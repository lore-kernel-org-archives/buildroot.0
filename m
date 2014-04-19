From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:52:17 +0200
Subject: [Buildroot] [git commit] wsapi: bump to version 1.6.1
Message-ID: <20140419215315.E6CD79C911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afef09eab3e9ad5ed29738e9b7340bd8777b6858
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wsapi/wsapi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 9171b71..0cca6cb 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.6-1
+WSAPI_VERSION = 1.6.1-1
 WSAPI_LICENSE = MIT
 
 $(eval $(luarocks-package))
