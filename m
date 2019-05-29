From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:24 -0400
Subject: [Buildroot] [PATCH 06/19] package/dbus-python: add hash for license
 file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.21.0
