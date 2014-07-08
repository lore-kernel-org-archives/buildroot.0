From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 00:23:43 +0200
Subject: [Buildroot] [git commit] dmraid: add license information
Message-ID: <20140708222428.2464D9D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13f8c39294a6ddac22c887d3c374e869b466c769
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter; license is GPLv2+, drop LGPL, add LICENSE file]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/dmraid.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 412c903..baeca36 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -12,6 +12,8 @@ DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
 DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+DMRAID_LICENSE = GPLv2
+DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
 
 DMRAID_DEPENDENCIES = lvm2
 
