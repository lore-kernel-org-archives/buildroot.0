From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:07 +0200
Subject: [Buildroot] [PATCH 06/11] package/libusb-compat: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libusb-compat/libusb-compat.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index c01eee532b..26c3a80ebc 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a  libusb-compat-0.1.5.tar.bz2
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
-- 
2.20.1
