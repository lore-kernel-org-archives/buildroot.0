From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Oct 2018 19:56:38 +0200
Subject: [Buildroot] [git commit] Update for 2018.08.2
Message-ID: <20181025181220.4745688F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0106c04a04cd84506f8892272d6b902a2287e977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 507020139190aaf44793c3c901321d23ba476c13)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3f46831a9e..9120e59882 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2018.08.2, Released October 25th, 2018
+
+	Important / security related fixes.
+
+	Workaround added for incompatibility issues between host-dtc
+	and older U-Boot and Linux kernel versions.
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
+	cups-filters, dtc, erlang, file, freetype, gcc, git, gvfs,
+	jasper, leveldb, libarchive, libssh, live555, ljlinenoise,
+	mariadb, mongoose, netsnmp, nmap, nodejs, ntp, open-plc-utils,
+	poco, psmisc, ptpd2, python-enum34, qemu, qt, qt5base,
+	setools, spice, spice-protocol, tinc, ustr, wireshark,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11396: uboot environment image checksum invalid if target is big endian
+
 2018.08.1, Released October 7th, 2018
 
 	Important / security related fixes.
