From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:04:21 +0100
Subject: [Buildroot] [git commit] package/sconeserver: bump version
Message-ID: <20181109210209.165DE821A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca17e0c7a02298b0250cdc121bcacef0b58fffe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/sconemad/sconeserver/commit/6b932d7d8dbb700b830205e7111e469cefff490c
adds support for OpenSSL 1.1

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sconeserver/sconeserver.hash | 3 ++-
 package/sconeserver/sconeserver.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
index 978b442f53..e1ff4486bc 100644
--- a/package/sconeserver/sconeserver.hash
+++ b/package/sconeserver/sconeserver.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 38e72b962eb42bea8f0deb6f101833f8f2f2fa8c53f0dc03f3eb5d56873517c8 sconeserver-d659468cd164e6a6cc12932cc6780566b04f8328.tar.gz
+sha256 dfdbbcd29c089eeb341dd3bbd434cca97fefaa97f94c91525e5953d3ab0a2d9a  sconeserver-6b932d7d8dbb700b830205e7111e469cefff490c.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index cf7bcbcb15..12cadbfd20 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONESERVER_VERSION = d659468cd164e6a6cc12932cc6780566b04f8328
+SCONESERVER_VERSION = 6b932d7d8dbb700b830205e7111e469cefff490c
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
