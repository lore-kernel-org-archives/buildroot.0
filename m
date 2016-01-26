From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:33:04 +0100
Subject: [Buildroot] [git commit] package/setools: add homepage to Config.in
Message-ID: <20160201224703.5C43D7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6201e08f8201c19b53c6d383f3ed8e02c4e0c7f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 7bab789..c291b21 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -26,6 +26,8 @@ config BR2_PACKAGE_SETOOLS
 	   * secmds - command-line tools to analyze and search SELinux
 	     policy.
 
+	  https://github.com/TresysTechnology/setools3/wiki
+
 comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
