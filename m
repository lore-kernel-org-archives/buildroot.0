From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:40:21 +0200
Subject: [Buildroot] [git commit] pv: bump to version 1.4.12
Message-ID: <20131006184800.0CD959B92C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d57d4a8ede2949f5a02d90528392bf34a2ec8a81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/pv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index c2dca2a..a8b2651 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.4.6
+PV_VERSION = 1.4.12
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
