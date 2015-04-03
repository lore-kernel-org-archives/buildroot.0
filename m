From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:05:19 +0200
Subject: [Buildroot] [git commit] package/softether: bump version
Message-ID: <20150403120728.3789D81918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d97ef5d7c29c1def0b7e7529612a8c60fb6156f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/softether.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index d73d33c..17a450f 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 64fd19e6f849247e3daee765ad278c6bf072afcb
+SOFTETHER_VERSION = 18b120e5f747a84d26302ec706f6c1c91d642ace
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
