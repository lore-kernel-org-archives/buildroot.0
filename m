From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 21:35:53 +0100
Subject: [Buildroot] [git commit] minidlna: bump version to 1.1.2
Message-ID: <20140315211417.568F29BEEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b02c64a2f07e3ae0215262eb8af0c0a6ca5e979
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index ea6a3fc..e1e2f3d 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.1.1
+MINIDLNA_VERSION = 1.1.2
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
