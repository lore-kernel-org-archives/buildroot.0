From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:17 -0000
Subject: [Buildroot] [git commit] package/mono: enable mono library
	compilation
Message-ID: <20150302222716.62759807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa053f0e4264ab49a5594e63aed2d2ea7ca7a240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch enables the compilation of mono library to be used
in third party software.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/mono.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 0bbf338..9ec3c24 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -21,7 +21,6 @@ MONO_AUTORECONF = YES
 MONO_CONF_OPTS = --disable-gtk-doc \
 	--with-mcs-docs=no \
 	--with-moonlight=no \
-	--disable-libraries \
 	--with-ikvm-native=no \
 	--enable-minimal=aot,profiler,debug \
 	--disable-mcs-build \
