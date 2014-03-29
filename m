From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:31:03 +0100
Subject: [Buildroot] [git commit] package/tvheadend: bump revision
Message-ID: <20140329173147.74FA99C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b6a2df492a621b68fe4d9c573143f02dd0d50c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds a bunch of fixes all over the place.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 87be703..4cfcf90 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3
+TVHEADEND_VERSION           = 6482d33ba90848018c530018e5c38992b8ac921c
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
