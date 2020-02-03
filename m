From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:44:53 +0100
Subject: [Buildroot] [git commit] package/g*: add license file hashes
Message-ID: <20200203133729.9808088723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaae3ab1f8af372b8119cdb623c2e80bf1cadd5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gamin/gamin.hash                                 | 3 ++-
 package/genext2fs/genext2fs.hash                         | 1 +
 package/genromfs/genromfs.hash                           | 1 +
 package/gettext-gnu/gettext-gnu.hash                     | 3 ++-
 package/giblib/giblib.hash                               | 3 ++-
 package/glmark2/glmark2.hash                             | 4 +++-
 package/gmpc/gmpc.hash                                   | 3 ++-
 package/gnupg/gnupg.hash                                 | 4 +++-
 package/gnuplot/gnuplot.hash                             | 3 ++-
 package/go-bootstrap/go-bootstrap.hash                   | 3 ++-
 package/google-breakpad/google-breakpad.hash             | 3 ++-
 package/gpm/gpm.hash                                     | 1 +
 package/gqview/gqview.hash                               | 1 +
 package/granite/granite.hash                             | 4 +++-
 package/graphite2/graphite2.hash                         | 3 ++-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash             | 4 ++++
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash   | 4 +++-
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash   | 3 +++
 package/gstreamer/gst-plugins-base/gst-plugins-base.hash | 3 +++
 package/gstreamer/gst-plugins-good/gst-plugins-good.hash | 2 ++
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash | 5 +++--
 package/gstreamer/gstreamer/gstreamer.hash               | 1 +
 package/gtk2-engines/gtk2-engines.hash                   | 4 +++-
 package/gtkmm3/gtkmm3.hash                               | 3 +++
 package/guile/guile.hash                                 | 6 +++++-
 25 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/package/gamin/gamin.hash b/package/gamin/gamin.hash
index 0a43706193..e28660dded 100644
--- a/package/gamin/gamin.hash
+++ b/package/gamin/gamin.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1	gamin-0.1.10.tar.gz
+sha256  28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1  gamin-0.1.10.tar.gz
+sha256  7f9ffc38883325f011f331a9d6074ffd0175fbcecd57f69c577fb3845f333876  COPYING
diff --git a/package/genext2fs/genext2fs.hash b/package/genext2fs/genext2fs.hash
index 46b8af352d..add44c4c4e 100644
--- a/package/genext2fs/genext2fs.hash
+++ b/package/genext2fs/genext2fs.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecfc  genext2fs-1.4.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/genromfs/genromfs.hash b/package/genromfs/genromfs.hash
index 477e5d2dcb..0be88ee1b4 100644
--- a/package/genromfs/genromfs.hash
+++ b/package/genromfs/genromfs.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  30f37fc734572c1dbaa2504585bc23ba6b8fd7df767ae7155995b2ca0ebed960  genromfs-0.5.2.tar.gz
+sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index a2ab298760..5a621ae2d3 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -2,4 +2,5 @@
 md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
 sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
 # License files, locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/giblib/giblib.hash b/package/giblib/giblib.hash
index 942aee705b..0c83a55457 100644
--- a/package/giblib/giblib.hash
+++ b/package/giblib/giblib.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	176611c4d88d742ea4013991ad54c2f9d2feefbc97a28434c0f48922ebaa8bac  giblib-1.2.4.tar.gz
+sha256  176611c4d88d742ea4013991ad54c2f9d2feefbc97a28434c0f48922ebaa8bac  giblib-1.2.4.tar.gz
+sha256  8601e2dacede853fe325f7fd3a11f93b1753d576db60426f1b0ff4e68f41ff07  COPYING
diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index c8772422eb..ffd1ba2d50 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 6a9de46c098406895411b629fe8fadfdce92360500f0f10e4cc60a889a1692eb glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e.tar.gz
+sha256  6a9de46c098406895411b629fe8fadfdce92360500f0f10e4cc60a889a1692eb  glmark2-9e01aef1a786b28aca73135a5b00f85c357e8f5e.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  16fbc228292bd774b263b212ae422c524cbf3b2078bcf21b22f8bdd4373be617  COPYING.SGI
diff --git a/package/gmpc/gmpc.hash b/package/gmpc/gmpc.hash
index cd39822c39..66de8b6226 100644
--- a/package/gmpc/gmpc.hash
+++ b/package/gmpc/gmpc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c	gmpc-11.8.16.tar.gz
+sha256  a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c  gmpc-11.8.16.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
index 3bacdf6563..f4b33bda6b 100644
--- a/package/gnupg/gnupg.hash
+++ b/package/gnupg/gnupg.hash
@@ -1,3 +1,5 @@
 # Locally computed based on signature
 # https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.23.tar.bz2.sig
-sha256	c9462f17e651b6507848c08c430c791287cd75491f8b5a8b50c6ed46b12678ba	gnupg-1.4.23.tar.bz2
+sha256  c9462f17e651b6507848c08c430c791287cd75491f8b5a8b50c6ed46b12678ba  gnupg-1.4.23.tar.bz2
+# locally computed
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 1ea8c2852f..1f3a08bb00 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -2,4 +2,5 @@
 md5 8ec46520a86a61163a701b00404faf1a  gnuplot-5.0.6.tar.gz
 sha1 f7b8948166b22e5bd658d5cf7579716f4821dba0  gnuplot-5.0.6.tar.gz
 # Locally computed
-sha256 5bbe4713e555c2e103b7d4ffd45fca69551fff09cf5c3f9cb17428aaacc9b460  gnuplot-5.0.6.tar.gz
+sha256  5bbe4713e555c2e103b7d4ffd45fca69551fff09cf5c3f9cb17428aaacc9b460  gnuplot-5.0.6.tar.gz
+sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/go-bootstrap/go-bootstrap.hash b/package/go-bootstrap/go-bootstrap.hash
index 8938266f2d..03fd7d571f 100644
--- a/package/go-bootstrap/go-bootstrap.hash
+++ b/package/go-bootstrap/go-bootstrap.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959  go1.4.3.src.tar.gz
+sha256  9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959  go1.4.3.src.tar.gz
+sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  LICENSE
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 79e8d08b28..81715ec573 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 6f444233e88957c30cc2d5497ee9d72d104122ce2c25a7ef7f6be3af1b3f7353  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
+sha256  6f444233e88957c30cc2d5497ee9d72d104122ce2c25a7ef7f6be3af1b3f7353  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6.tar.gz
+sha256  f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  LICENSE
diff --git a/package/gpm/gpm.hash b/package/gpm/gpm.hash
index 7bbc43dd40..fac8931834 100644
--- a/package/gpm/gpm.hash
+++ b/package/gpm/gpm.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  a955053b36556ffa7c628ce18fd6de7d625966573fa412fb08869533d8f7385c  gpm-1.20.7.tar.lzma
+sha256  1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
diff --git a/package/gqview/gqview.hash b/package/gqview/gqview.hash
index eb65497131..3d1330d4ff 100644
--- a/package/gqview/gqview.hash
+++ b/package/gqview/gqview.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  12fea494e607a69eff31cdca13d306ef1b0b3b7850be0f8b236f267d8f2e9546  gqview-2.1.5.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index b9ed2874ce..48f62604fa 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,4 +1,6 @@
 # From https://launchpad.net/granite/0.4/0.4.1/+download/granite-0.4.1.tar.xz/+md5
 md5 b1002c0488bb9ade0ef89730c4f84393 granite-0.4.1.tar.xz
 # Calculated based on the hash above
-sha256 8bb411523e6cd5685c928dbfe08893892189cedf9fad5f537aa76182032cf09c  granite-0.4.1.tar.xz
+sha256  8bb411523e6cd5685c928dbfe08893892189cedf9fad5f537aa76182032cf09c  granite-0.4.1.tar.xz
+# Locally computed
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index ecf082b08d..e0c1aae670 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -2,4 +2,5 @@
 md5 b39d5ed21195f8b709bcee548c87e2b5  graphite2-1.3.10.tgz
 sha1 668f3bce96fc02d90ea875b401ed36b2e8957d2f  graphite2-1.3.10.tgz
 # Locally computed
-sha256 90fde3b2f9ea95d68ffb19278d07d9b8a7efa5ba0e413bebcea802ce05cda1ae  graphite2-1.3.10.tgz
+sha256  90fde3b2f9ea95d68ffb19278d07d9b8a7efa5ba0e413bebcea802ce05cda1ae  graphite2-1.3.10.tgz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
index 5f7f35d9a4..c83c051b48 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
@@ -1,2 +1,6 @@
 # From http://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-0.10.13.tar.bz2.md5
 md5	7f5beacaf1312db2db30a026b36888c4	gst-ffmpeg-0.10.13.tar.bz2
+# Locally computed
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
+sha256  03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  gst-libs/ext/libav/COPYING.LGPLv2.1
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  gst-libs/ext/libav/COPYING.LGPLv3
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
index f1d639142f..338ef33fe7 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.hash
@@ -1,2 +1,4 @@
 # locally computed
-sha256	568883b2a1d8d32e4004cb3f123790d0b4286c91c1fac38c9dc8e20bd1250764  gst-fsl-plugins-4.0.3.tar.gz
+sha256  568883b2a1d8d32e4004cb3f123790d0b4286c91c1fac38c9dc8e20bd1250764  gst-fsl-plugins-4.0.3.tar.gz
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING-LGPL-2
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
index 760ed31c9c..6448acc4cc 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.hash
@@ -1,2 +1,5 @@
 # From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-0.10.23.tar.xz.md5
 md5	e4822fa2cc933768e2998311a1565979	gst-plugins-bad-0.10.23.tar.xz
+# Locally computed
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.hash b/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
index 77eba71bb5..f71f8dfb2b 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
@@ -1,2 +1,5 @@
 # From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.36.tar.xz.md5
 md5	3d2337841b132fe996e5eb2396ac9438	gst-plugins-base-0.10.36.tar.xz
+# Locally computed
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.hash b/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
index 094dc87978..1b8b474207 100644
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
+++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
@@ -1,2 +1,4 @@
 # From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-0.10.31.tar.xz.md5
 md5	555845ceab722e517040bab57f9ace95	gst-plugins-good-0.10.31.tar.xz
+# Locally computed
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
index 56f2a8c4bd..8e103676e4 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
@@ -1,5 +1,6 @@
 # From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-0.10.19.tar.xz.md5
 md5	ba26045c8c8c91f0d48d327ccf53ac0c	gst-plugins-ugly-0.10.19.tar.xz
 # Locally computed
-sha256	4934f65ff892637e7efaf1cfe635779189dde429d0706f40c86a3aac476ea873	gst-plugins-ugly-0.10.19.tar.xz
-sha256	2a8aa4cd019fab333f1f8377bf7afa426d3038a033361d90fab70c335e9a53e7	cdio-cd-text-api.patch
+sha256  4934f65ff892637e7efaf1cfe635779189dde429d0706f40c86a3aac476ea873  gst-plugins-ugly-0.10.19.tar.xz
+sha256  2a8aa4cd019fab333f1f8377bf7afa426d3038a033361d90fab70c335e9a53e7  cdio-cd-text-api.patch
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer/gstreamer/gstreamer.hash b/package/gstreamer/gstreamer/gstreamer.hash
index 4fcf34ac32..9b3c42b44a 100644
--- a/package/gstreamer/gstreamer/gstreamer.hash
+++ b/package/gstreamer/gstreamer/gstreamer.hash
@@ -2,3 +2,4 @@
 md5	15389c73e091b1dda915279c388b9cb2	gstreamer-0.10.36.tar.xz
 # locally computed
 sha256  9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da  gstreamer-0.10.36.tar.xz
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gtk2-engines/gtk2-engines.hash b/package/gtk2-engines/gtk2-engines.hash
index ac56c7d73e..20125c706c 100644
--- a/package/gtk2-engines/gtk2-engines.hash
+++ b/package/gtk2-engines/gtk2-engines.hash
@@ -1,2 +1,4 @@
 # From http://ftp.gnome.org/pub/gnome/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
-sha256	15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5	gtk-engines-2.20.2.tar.bz2
+sha256  15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5  gtk-engines-2.20.2.tar.bz2
+# Locally computed
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 951b481f2c..87c59b2cab 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
 sha256	05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5	gtkmm-3.22.0.tar.xz
+# Locally computed
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index 63651cf740..47ac009757 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256 e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82  guile-2.0.14.tar.xz
+sha256  e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82  guile-2.0.14.tar.xz
+# Locally computed
+sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LESSER
