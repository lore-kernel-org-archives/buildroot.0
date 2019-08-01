From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:31:42 +0200
Subject: [Buildroot] [git commit] package/libsamplerate: add license hash
Message-ID: <20190801073837.F31FF813D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=301463eb0609a4daf3564ca3927fb8b6eb39025a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsamplerate/libsamplerate.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
index a303f0bcf8..73722563ef 100644
--- a/package/libsamplerate/libsamplerate.hash
+++ b/package/libsamplerate/libsamplerate.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256  0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1  libsamplerate-0.1.9.tar.gz
+# Locally computed
+sha256 2c1f76ce2effdddb425018405d5690c0b1ab4e6976e35296b0a6db65c5e1a55d  COPYING
