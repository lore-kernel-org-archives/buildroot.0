From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:23:43 +0200
Subject: [Buildroot] [git commit] package/dbus-glib: add hash for license
 file
Message-ID: <20190602201236.9950581354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d85a345b521b0652463bc1eee55ee368b44a0c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-glib/dbus-glib.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 8a80b71b45..098832431e 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256 7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825  dbus-glib-0.110.tar.gz
+
+# Locally calculated
+sha256 ef1634fc21d9112dca08f2557313584719d534d05213cf14f3c77938506266b4  COPYING
