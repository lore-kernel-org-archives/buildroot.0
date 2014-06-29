From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 18:15:57 +0200
Subject: [Buildroot] [git commit] bonnie: add license information
Message-ID: <20140629161610.5B6919D109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5870304107090ad2475c6bccdfc97d0503753b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bonnie/bonnie.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 9c576b6..b584b2a 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -7,6 +7,8 @@
 BONNIE_VERSION = 1.03e
 BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
 BONNIE_SITE = http://www.coker.com.au/bonnie++/
+BONNIE_LICENSE = GPLv2
+BONNIE_LICENSE_FILES = copyright.txt
 
 define BONNIE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
