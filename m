From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:32:00 +0200
Subject: [Buildroot] [git commit] explorercanvas: add license information
Message-ID: <20140701153344.35A609CE74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02866299d5cc4dbd3609af55e8b9c701090f8e58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/explorercanvas/explorercanvas.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 1d9363d..c360e96 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -7,6 +7,8 @@
 EXPLORERCANVAS_VERSION = r3
 EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files/
 EXPLORERCANVAS_SOURCE = excanvas_$(EXPLORERCANVAS_VERSION).zip
+EXPLORERCANVAS_LICENSE = Apache-2.0
+EXPLORERCANVAS_LICENSE_FILES = COPYING
 
 define EXPLORERCANVAS_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
