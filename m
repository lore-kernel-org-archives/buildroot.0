From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:06:37 +0100
Subject: [Buildroot] [git commit] pangomm: fix typo in Config.in following
	package rename
Message-ID: <20151216220708.1415880D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d3a2dc186272a17f09e5aa1b5cd0351e2b868a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pangomm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 241aa9f..6a84c42 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_PANGOMM
 
 	  http://www.gtkmm.org/
 
-comment "libpangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
