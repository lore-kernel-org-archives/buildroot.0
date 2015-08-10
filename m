From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 16:12:05 +0200
Subject: [Buildroot] [git commit branch/next] package/softether: bump version
Message-ID: <20150810141245.7A001819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b8be0bf50e7aebbe7525fae968d1b4bea33d38d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/softether.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 17a450f..489341e 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 18b120e5f747a84d26302ec706f6c1c91d642ace
+SOFTETHER_VERSION = 4b65e251f240d0b36c704acd598f4ceb07c41413
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_PATCH = \
 	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
