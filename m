From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 12 Feb 2015 14:49:30 +0100
Subject: [Buildroot] [PATCH v4 1/3] package/mono: enable mono library
	compilation
In-Reply-To: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1423748972-17471-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables the compilation of mono library to be used
in third party software.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.mk | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.1
