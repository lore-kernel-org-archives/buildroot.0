From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:13 +0100
Subject: [Buildroot] [PATCH 23/33] scons: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-24-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/scons/scons.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 45f2e1e..92cfe93 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,6 +1,9 @@
 SCONS_VERSION = 2.0.1
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
+SCONS_LICENSE = MIT
+SCONS_LICENSE_FILES = LICENSE.txt
+
 HOST_SCONS_DEPENDENCIES = $(NEED_PYTHON2)
 
 define HOST_SCONS_BUILD_CMDS
-- 
1.8.0
