From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:46:42 +0100
Subject: [Buildroot] [git commit] package/mcelog: bump version to v111
Message-ID: <20150320204749.3A9557FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70f74d866251f96abeb28f8b53ead786f45beb61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v110, mcelog detect Atom's cpuids.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mcelog/mcelog.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 5857403..1290e34 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v109
+MCELOG_VERSION = v111
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPLv2
