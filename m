From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:08:44 +0200
Subject: [Buildroot] [git commit] package/libdvdnav: fix typo:
	BR2_PREEFER_STATIC_LIB
Message-ID: <20141005120852.6A0C0B07BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8f986c449a3e08aff7fff531d7b26a1907a9d09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvdnav/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index fed3b16..40a375a 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBDVDNAV
 	  http://www.mplayerhq.hu
 
 comment "libdvdnav needs a toolchain w/ dynamic library, largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREEFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
