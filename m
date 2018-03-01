From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 28 Feb 2018 23:23:38 -0600
Subject: [Buildroot] [next,v2 7/8] e2fsprogs: add CPE id
In-Reply-To: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519881819-51445-8-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Matt W
 - Added second CPE ID
---
 package/e2fsprogs/e2fsprogs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 99019c7..285c032 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,6 +10,8 @@ E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2F
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
+E3FSPROGS_CPE_ID_VENDOR = e2fsprogs_project
+E2FSPROGS_CPE_ID = e2fsprogs_project:$(E2FSPROGS_NAME):$(E2FSPROGS_VERSION) ext2_filesystems_utilities:$(E2FSPROGS_NAME):$(E2FSPROGS_VERSION)
 
 # Use libblkid and libuuid from util-linux for host and target packages.
 # This prevents overriding them with e2fsprogs' ones, which may cause
-- 
1.9.1
