From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:45:37 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20140602111141.64E4A9CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd15da6b4ec864fc315df06549048a49e4c2366c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lotta fixes all over the tree.
Still no new release... :-/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index ac4c290..244e129 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 6482d33ba90848018c530018e5c38992b8ac921c
+TVHEADEND_VERSION = 0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE
