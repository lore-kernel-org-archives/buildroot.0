From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Jan 2019 11:01:10 +0100
Subject: [Buildroot] [PATCH 2/3] package/gnu-efi: bump version to 3.0.9
In-Reply-To: <20190111100111.17867-1-peter@korsgaard.com>
References: <20190111100111.17867-1-peter@korsgaard.com>
Message-ID: <20190111100111.17867-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for StrnCat, needed by shim.

Also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnu-efi/gnu-efi.hash | 7 ++++---
 package/gnu-efi/gnu-efi.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 1bd0f8c5dc..9ac2b51fe3 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,5 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5 46f633758a8a37db9fd6909fe270c26b gnu-efi-3.0.6.tar.bz2
-sha1 9f0f75b64c84423f3386da6f3200f5ed7471d9cb gnu-efi-3.0.6.tar.bz2
+md5 32af17b917545a693e549af2439c4a99 gnu-efi-3.0.9.tar.bz2
+sha1 9b39e06206e63eba56d59a648a7e4f20aead6962 gnu-efi-3.0.9.tar.bz2
 # Locally computed
-sha256 21515902d80fbea23328a61d70d3d51a47204abd1507ebfa27550a7b9bf22c91 gnu-efi-3.0.6.tar.bz2
+sha256 6715ea7eae1c7e4fc5041034bd3f107ec2911962ed284a081e491646b12277f0  gnu-efi-3.0.9.tar.bz2
+sha256 42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index b83a5a9eb4..fe3c8ac343 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.6
+GNU_EFI_VERSION = 3.0.9
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-- 
2.11.0
