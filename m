From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:35:13 +0100
Subject: [Buildroot] [git commit] package/azmq: fix NPTL typo in comment
Message-ID: <20191031214245.3B8C28E3A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dd6dadf00e333ee671d7ad7aaed8e97b2f537fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/azmq/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index eeafa2ad6d..2904890d5f 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_AZMQ
 
 	  https://github.com/zeromq/azmq
 
-comment "azmq needs a toolchain w/ C++11, wchar and NTPL"
+comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
