From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Oct 2018 21:07:23 +0200
Subject: [Buildroot] [git commit] Update for 2018.02.7
Message-ID: <20181025190859.0442388F3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=684f79d0f290c305ec488b68371b744eaa297bf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c9284703c496b913d936689df72d49e095442e4)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/CHANGES b/CHANGES
index 9120e59882..752d99adf9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -490,6 +490,33 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
+2018.02.7, Released October 25th, 2018
+
+	Important / security related fixes.
+
+	Detect and reject build paths containing '@', as this confuses
+	a number of packages, including GCC.
+
+	utils/get-developers: Add -e option for use with git
+	send-email.
+
+	utils/diffconfig: Make it work for (non-Buildroot) config
+	files not using the BR2_ prefix.
+
+	u-boot: Fix for environment image handling on big endian
+	systems.
+
+	Updated/fixed packages: binutils, ca-certificates,
+	cups-filters, erlang, file, freetype, gcc, git, gvfs, leveldb,
+	libarchive, libcurl, libssh, live555, ljlinenoise, mariadb,
+	mongoose, netsnmp, nmap, nodejs, ntp, open-plc-utils, poco,
+	psmisc, ptpd2, python-enum34, qemu, qt, qt5base, setools,
+	spice, spice-protocol, tinc, ustr, wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11396: uboot environment image checksum invalid if target is big endian
+
 2018.02.6, Released October 7th, 2018
 
 	Important / security related fixes.
