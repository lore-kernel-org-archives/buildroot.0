From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:37:58 +0200
Subject: [Buildroot] [git commit] gnuradio: remove host-python-cheetah
 dependency
Message-ID: <20180805123230.15CA18B4A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7f1b030413a51637323a755cbd985b06026990e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python-cheetah has been replaced by host-python-mako:
https://github.com/gnuradio/volk/commit/1b2bedc8685c4dc2b3587068339d69b5ab1c874d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/gnuradio.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 9573b65b73..ed537e3934 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -11,10 +11,8 @@ GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# host-python-cheetah, host-python-mako and host-python-six are needed for volk
-# to compile
+# host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
-	host-python-cheetah \
 	host-python-mako \
 	host-python-six \
 	host-swig \
