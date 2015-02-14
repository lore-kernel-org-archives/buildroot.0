From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 10:19:20 +0100
Subject: [Buildroot] [git commit branch/next] package/mono: enable mono
	library compilation
Message-ID: <20150214091929.2641580416@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa053f0e4264ab49a5594e63aed2d2ea7ca7a240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
