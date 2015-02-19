From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:33:16 +0100
Subject: [Buildroot] [git commit] dmraid: remove superfluous
	INSTALL_TARGET_OPTS
Message-ID: <20150302222719.6D75F807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2058de2bbcd8fb36c16132596a4835800def4741
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmraid/dmraid.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index a6ed57f..fbb2387 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -11,7 +11,6 @@ DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
-DMRAID_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install
 DMRAID_LICENSE = GPLv2
 DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
 
