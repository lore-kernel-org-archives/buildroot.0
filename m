From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:32:56 +0100
Subject: [Buildroot] [git commit] genext2fs: add license information
Message-ID: <20130128223400.8B93F9A864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42169a4e71bf02e496aab3b8dccc3f2e800559eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/genext2fs/genext2fs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 6126a74..45e9695 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -7,6 +7,8 @@
 GENEXT2FS_VERSION = 1.4.1
 GENEXT2FS_SOURCE = genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE = http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
+GENEXT2FS_LICENSE = GPLv2
+GENEXT2FS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
