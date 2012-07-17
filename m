From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:07:26 +0200
Subject: [Buildroot] [git commit] lzop: define license
Message-ID: <20120717173301.3EC1896A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46f81aa05b226c0ab77bb31346ba0f83dfb3c006
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzop/lzop.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 6d1d674..1e98030 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,6 +6,8 @@
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
+LZOP_LICENSE = GPLv2+
+LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
 
 $(eval $(call AUTOTARGETS))
