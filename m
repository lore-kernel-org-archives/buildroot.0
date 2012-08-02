From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:56 -0000
Subject: [Buildroot] [git commit branch/next] m4: define license
Message-ID: <20120802195251.B4C738D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f6d7677fd51ae2d1b69a6d8feb1d4f3dab2b237
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/m4/m4.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 173bba8..1e891c5 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -7,6 +7,8 @@
 M4_VERSION = 1.4.16
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
+M4_LICENSE = GPLv3+
+M4_LICENSE_FILES = COPYING
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
