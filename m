From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:26 -0600
Subject: [Buildroot] [NEXT 11/26] e2fsprogs: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-12-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/e2fsprogs/e2fsprogs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 99019c7..05915ca 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,6 +10,7 @@ E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2F
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
+E2FSPROGS_CPE_ID = e2fsprogs_project:$(E2FSPROGS_NAME):$(E2FSPROGS_VERSION)
 
 # Use libblkid and libuuid from util-linux for host and target packages.
 # This prevents overriding them with e2fsprogs' ones, which may cause
-- 
1.9.1
