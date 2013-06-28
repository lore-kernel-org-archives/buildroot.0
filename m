From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:46:30 +0200
Subject: [Buildroot] [git commit] parted: define license
Message-ID: <20130628195146.377EC9B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1b1e5f5b36ed9b39f46a80c333a42386088a57c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/parted/parted.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 78c755a..773e332 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -9,5 +9,7 @@ PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = readline util-linux lvm2
 PARTED_INSTALL_STAGING = YES
+PARTED_LICENSE = GPLv3+
+PARTED_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
