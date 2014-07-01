From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:22:28 +0200
Subject: [Buildroot] [git commit] devmem2: add license information
Message-ID: <20140701153344.134209CE74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5055bf1fef8e7b9fe6d9a275dfa3603e6e711875
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/devmem2/devmem2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index ab111e1..7f0594e 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -7,6 +7,8 @@
 DEVMEM2_SITE = http://free-electrons.com/pub/mirror
 DEVMEM2_SOURCE = devmem2.c
 DEVMEM2_VERSION = 1
+DEVMEM2_LICENSE = GPLv2+
+DEVMEM2_LICENSE_FILES = devmem2.c
 
 define DEVMEM2_EXTRACT_CMDS
 	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
