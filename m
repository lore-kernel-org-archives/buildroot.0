From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:17 +0100
Subject: [Buildroot] [RFC v2 17/31] m4: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-18-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/m4/m4.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 173bba8..f376ca2 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -7,6 +7,8 @@
 M4_VERSION = 1.4.16
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
+M4_LICENSE = GPLv3
+M4_LICENSE_FILES = COPYING
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
-- 
1.7.5.4
