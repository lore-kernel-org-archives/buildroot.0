From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:59:28 +0200
Subject: [Buildroot] [git commit] package/tremor: add upstream site to help
	text
Message-ID: <20170601202900.76DAE82A6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44d276eb2e03214c4786cff208e6897232bd0248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tremor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tremor/Config.in b/package/tremor/Config.in
index 1a478c4..ec7b8f8 100644
--- a/package/tremor/Config.in
+++ b/package/tremor/Config.in
@@ -6,3 +6,5 @@ config BR2_PACKAGE_TREMOR
 	  decoder. It provides a decoding API similar to libvorbis,
 	  but gives much better performance on systems without a
 	  floating-point unit.
+
+	  https://wiki.xiph.org/Tremor
