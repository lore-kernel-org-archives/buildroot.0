From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:03:15 +0100
Subject: [Buildroot] [git commit] pcmanfm: add missing BR2_USE_MMU
	dependency from gamin
Message-ID: <20140224083840.B8CD69BA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a42efd0859a718e60fc60a34fd34a07ccee15283
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcmanfm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
