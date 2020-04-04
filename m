From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2020 15:23:37 +0200
Subject: [Buildroot] [git commit] package/sysdig: update upstream URL in
 Config.in
Message-ID: <20200404131211.2B1898A649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca3166da48bbb4247f5823b2a53499c8959c4705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sysdig homepage we have points to an "on-sale" domain, that is
purportedly serving malware while at it. Update to point to the wiki on
github instead.

Fixes #12746.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - use wiki instead of git repo
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysdig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index c37d8d05cc..0a1b3f8935 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_SYSDIG
 	  Think of it as strace + tcpdump + lsof + awesome sauce.
 	  With a little Lua cherry on top.
 
-	  http://sysdig.org
+	  https://github.com/draios/sysdig/wiki
 
 comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
