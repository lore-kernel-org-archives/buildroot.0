From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 15:02:14 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/sysdig: update
 upstream URL in Config.in
Message-ID: <20200408124933.02D1D839CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=440450bc5dee2421d7ca311bd879b41fb8b87594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit ca3166da48bbb4247f5823b2a53499c8959c4705)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysdig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 672c44d211..8c93e2beee 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_SYSDIG
 	  Think of it as strace + tcpdump + lsof + awesome sauce.
 	  With a little Lua cherry on top.
 
-	  http://sysdig.org
+	  https://github.com/draios/sysdig/wiki
 
 comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
