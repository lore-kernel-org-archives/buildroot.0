From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Jun 2016 15:48:30 +0100
Subject: [Buildroot] [PATCH 2/3] elfutils: specify the real reason for
	needing autoreconf
In-Reply-To: <1466174911-13566-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466174911-13566-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1466174911-13566-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/elfutils/elfutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 76b36bc..074ca02 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -12,7 +12,7 @@ ELFUTILS_LICENSE = GPLv3, GPLv2, LGPLv3
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_DEPENDENCIES = zlib
 
-# The tarball does not have a generated configure script
+# We patch configure.ac
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
 
-- 
2.7.3
