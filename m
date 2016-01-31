From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 21:06:14 +0100
Subject: [Buildroot] [git commit] package/smack: bump version to 1.1.0
Message-ID: <20160201224704.0E65D7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bb7ad75830ed0499be41cbcea36bb905f67c815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smack/smack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 7e0a362..3ef4d47 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMACK_VERSION = v1.0.4
+SMACK_VERSION = v1.1.0
 SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
 SMACK_LICENSE = LGPLv2.1
 SMACK_LICENSE_FILES = COPYING
