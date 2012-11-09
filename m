From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 12:45:45 +0000
Subject: [Buildroot] [PATCH] oprofile: add license information
Message-ID: <1352465145-18842-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/oprofile/oprofile.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 54c46dd..17d225a 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -6,6 +6,8 @@
 
 OPROFILE_VERSION = 0.9.7
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
+OPROFILE_LICENSE = GPLv2
+OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
-- 
1.7.10.4
