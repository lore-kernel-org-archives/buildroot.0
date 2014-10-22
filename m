From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 18:10:32 +0200
Subject: [Buildroot] [git commit] libnl: need->needs for toolchain comment
Message-ID: <20141022161036.EDFB5B0013@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4294df577a52537f66a12e0be4aa8854f8fb4a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnl/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 74a2e79..af045e7 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBNL_TOOLS
 	help
 	  Install binary tools.
 
-comment "libnl tools need a toolchain w/ dynamic library"
+comment "libnl tools needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 endif
 
