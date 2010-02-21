From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:59 +0100
Subject: [Buildroot] [PATCH 21/38] gmpc: add dependency on host-intltool
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5ea2ac5c14ba7fc5db21b94a97e7bb22adad8756.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmpc/gmpc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 7110d15..0db89b9 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -11,7 +11,7 @@ GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes \
 		ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys
 
-GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2
+GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2 host-intltool
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
 GMPC_DEPENENCIES += xlib_libSM
-- 
1.6.3.3
