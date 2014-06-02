From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:46:51 +0200
Subject: [Buildroot] [git commit] package/snappy: do not line-up variables
Message-ID: <20140602111141.8A2F39CE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40ca4044bdeea7d5501e025d30e65f35e30442e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index b94f8cc..c30cb3c 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SNAPPY_VERSION		= 1.1.1
-SNAPPY_SITE		= http://snappy.googlecode.com/files/
-SNAPPY_LICENSE		= BSD-3c
-SNAPPY_LICENSE_FILES	= COPYING
-SNAPPY_INSTALL_STAGING	= YES
+SNAPPY_VERSION = 1.1.1
+SNAPPY_SITE = http://snappy.googlecode.com/files/
+SNAPPY_LICENSE = BSD-3c
+SNAPPY_LICENSE_FILES = COPYING
+SNAPPY_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
