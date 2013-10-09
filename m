From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:36:11 +0200
Subject: [Buildroot] [git commit] rtorrent: needs mmu
Message-ID: <20131009214149.CD73E9B9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef6cd52b8a4a372d5fcc6b5a66f3b8d1ea310d56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtorrent/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 7b21b5a..218cc6d 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RTORRENT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
