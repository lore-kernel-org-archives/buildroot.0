From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:41:59 +0200
Subject: [Buildroot] [PATCH 16/18] package/mjpegtools: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpegtools/mjpegtools.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mjpegtools/mjpegtools.hash b/package/mjpegtools/mjpegtools.hash
index db184f784d..76e9403f83 100644
--- a/package/mjpegtools/mjpegtools.hash
+++ b/package/mjpegtools/mjpegtools.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.1.0/
 md5	57bf5dd78976ca9bac972a6511b236f3	mjpegtools-2.1.0.tar.gz
 sha1	b9effa86280e23d67369e842e5cb645948583097	mjpegtools-2.1.0.tar.gz
+# Locally computed
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
-- 
2.20.1
