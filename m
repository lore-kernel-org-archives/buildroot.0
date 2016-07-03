From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] toolchain: add hidden symbol for fortran
	support in the toolchain
Message-ID: <20160703145820.772D881E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8a05376f607d4212dca615cf723df67228f5a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This symbol should be used in all packages requiring/testing for fortran
support.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 96ce3d1..65df31b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -21,6 +21,9 @@ config BR2_ENABLE_LOCALE
 config BR2_INSTALL_LIBSTDCPP
 	bool
 
+config BR2_TOOLCHAIN_HAS_FORTRAN
+	bool
+
 config BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
