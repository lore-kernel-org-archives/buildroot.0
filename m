From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:12 +0100
Subject: [Buildroot] [PATCH 22/33] libmad: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-23-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libmad/libmad.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 6999b66..1ce52ec 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -8,6 +8,8 @@ LIBMAD_VERSION = 0.15.1b
 LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
 LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LIBTOOL_PATCH = NO
+LIBMAD_LICENSE = GPLv2
+LIBMAD_LICENSE_FILES = COPYING
 
 define LIBMAD_PREVENT_AUTOMAKE
 	# Prevent automake from running.
-- 
1.8.0
