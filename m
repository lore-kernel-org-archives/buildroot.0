From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:35:23 +0200
Subject: [Buildroot] [git commit] rsh-redone: add license information
Message-ID: <20140701224922.5B5829D132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0bc4b1005ee3af54db135be7534c0a987b0c64a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsh-redone/rsh-redone.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 6e617c2..9c8a39d 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -7,6 +7,8 @@
 RSH_REDONE_VERSION = 85
 RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
 RSH_REDONE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rsh-redone
+RSH_REDONE_LICENSE = GPLv2
+RSH_REDONE_LICENSE_FILES = rsh.c
 
 RSH_REDONE_BINS-y =
 RSH_REDONE_BINS-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
