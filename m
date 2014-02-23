From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 23:58:10 +0100
Subject: [Buildroot] [PATCH 6/7] pcmanfm: add missing BR2_USE_MMU dependency
	from gamin
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393196291-12636-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index f6a3984..cf77e36 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	select BR2_PACKAGE_XLIB_LIBX11
-- 
1.8.3.2
