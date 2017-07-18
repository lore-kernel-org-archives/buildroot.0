From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:57:13 +0200
Subject: [Buildroot] [git commit] git: use BR2_KERNEL_MIRROR as download site
Message-ID: <20170718215312.D347781732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1e4a57686baf2b3e0dfe6c0ad4d08525a17acd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 52907a2..1d81955 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -6,7 +6,7 @@
 
 GIT_VERSION = 2.13.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
-GIT_SITE = https://www.kernel.org/pub/software/scm/git
+GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
