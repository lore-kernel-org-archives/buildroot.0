From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:44 +0200
Subject: [Buildroot] [PATCH 01/18] package/cairomm: add license hash
Message-ID: <20190804064201.10667-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cairomm/cairomm.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index bebd474b12..573104ec96 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,2 +1,4 @@
 # From http://ftp.gnome.org/pub/gnome/sources/cairomm/1.12/cairomm-1.12.0.sha256sum
 sha256	a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6	cairomm-1.12.0.tar.xz
+# Locally computed
+sha256 bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
-- 
2.20.1
