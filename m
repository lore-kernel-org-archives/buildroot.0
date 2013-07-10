From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:50 -0700
Subject: [Buildroot] [PATCH 11/11] inadyn: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-11-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/inadyn/inadyn.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 221a3d1..12f8acc 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -7,6 +7,8 @@
 INADYN_VERSION = 1.98.1
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
 INADYN_SITE = https://github.com/downloads/troglobit/inadyn
+INADYN_LICENSE = GPLv2+
+INADYN_LICENSE_FILES = COPYING LICENSE
 
 define INADYN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
1.7.4.1
