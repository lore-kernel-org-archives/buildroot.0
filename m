From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:40 +0100
Subject: [Buildroot] [RFC 07/15] m4: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/m4/m4.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 173bba8..480df7b 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -7,6 +7,7 @@
 M4_VERSION = 1.4.16
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
+M4_LICENSE = GPL_V3
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
-- 
1.7.5.4
