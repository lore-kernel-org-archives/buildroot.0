From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Mar 2014 15:38:27 +0100
Subject: [Buildroot] [PATCH v2 2/6] lttng-libust: bump version to 2.4.0
In-Reply-To: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
References: <1394289511-10524-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394289511-10524-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2
- rebase
---
 package/lttng-libust/lttng-libust.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index b0ebd3f..375a6a3 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.2.0
+LTTNG_LIBUST_VERSION = 2.4.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
+LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-- 
1.9.0
