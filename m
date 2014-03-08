From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Mar 2014 15:38:26 +0100
Subject: [Buildroot] [PATCH v2 1/6] liburcu: bump version to 0.8.3
In-Reply-To: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
References: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394289511-10524-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- rebase
---
 package/liburcu/liburcu.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index a586382..44b640d 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.7.7
+LIBURCU_VERSION = 0.8.3
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
-LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE
-LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt LICENSE
+LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
+LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
 
-- 
1.9.0
