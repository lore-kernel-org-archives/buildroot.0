From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:34:34 +0200
Subject: [Buildroot] [git commit] package/libusb-compat: add license hash
Message-ID: <20190801073838.1A5A3813D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84c9c3654c1cc5d979cf63d9526a986757c9177e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
