From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 00:38:03 +0100
Subject: [Buildroot] [git commit] webkit: select jpeg
Message-ID: <20130326234032.488969B31B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=653bfd0b913f5bea69737c6ae10d765e10595b62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/fc6ca5d72aefcb2d2276c34663579d0633dc900c/

Webkit has jpeg as a dependency, so ensure it also gets selected in
Config.in

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 34071e4..c6711b8 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBGAIL
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
