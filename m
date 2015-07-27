From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:43:19 +0200
Subject: [Buildroot] [git commit branch/next] qextserialport: change license
	file
Message-ID: <20150808105644.8C39C7FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c8d93c88d722143b785034439c61358a9481c68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's now LICENSE.md, fixes:
http://autobuild.buildroot.net/results/3e0/3e0f954df9196e89043f4aaad154dfdece08480a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/qextserialport.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 6f82b39..39e0407 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -7,7 +7,7 @@
 QEXTSERIALPORT_VERSION = ada321a9ee463f628e7b781b8ed00ff219152158
 QEXTSERIALPORT_SITE = $(call github,qextserialport,qextserialport,$(QEXTSERIALPORT_VERSION))
 QEXTSERIALPORT_LICENSE = MIT
-QEXTSERIALPORT_LICENSE_FILES = LICENSE
+QEXTSERIALPORT_LICENSE_FILES = LICENSE.md
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT),y)
