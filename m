From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:24:16 +0200
Subject: [Buildroot] [git commit branch/next] package/dbus-python: add hash
 for license file
Message-ID: <20190530223346.7F22B8E72C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c6b05fcba509c6f95feb84eaabe0e9472b22e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-python/dbus-python.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 991bb42787..5bf2f507c6 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f	dbus-python-1.2.8.tar.gz
+
+# Locally calculated
+sha256	1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0	COPYING
