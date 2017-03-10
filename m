From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 10:28:19 +0100
Subject: [Buildroot] [git commit] netsniff-ng: add homepage link
Message-ID: <20170310092852.6410682552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e856095b17c67beeb41b39600f64b4d425274f3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 00617e3..b59c876 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_NETSNIFF_NG
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
+	  http://netsniff-ng.org
+
 comment "netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC \
