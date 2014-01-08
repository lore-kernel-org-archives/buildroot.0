From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 22:33:15 +0100
Subject: [Buildroot] [git commit] libdmtx: add license information
Message-ID: <20140108213640.0FF259C3EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c96bc7372fda02c782740c6fb81c085119b9c66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdmtx/libdmtx.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 69c7b88..146534e 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -6,6 +6,8 @@
 
 LIBDMTX_VERSION = 0.7.4
 LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
+LIBDMTX_LICENSE = BSD-2c or Special Permission
+LIBDMTX_LICENSE_FILES = LICENSE
 LIBDMTX_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
