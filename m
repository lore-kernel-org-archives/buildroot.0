From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:36 +0100
Subject: [Buildroot] [git commit] package/s*: add license file hashes
Message-ID: <20200203133730.6DAB988723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38d14c57040b2880f53c372c642c5fee58595ac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/syslinux/syslinux.hash                            | 4 +++-
 package/scrypt/scrypt.hash                             | 4 +++-
 package/sdl2_gfx/sdl2_gfx.hash                         | 4 +++-
 package/sdl2_mixer/sdl2_mixer.hash                     | 3 ++-
 package/sdl2_net/sdl2_net.hash                         | 3 ++-
 package/sdl2_ttf/sdl2_ttf.hash                         | 3 ++-
 package/sdl_gfx/sdl_gfx.hash                           | 3 +++
 package/sdl_image/sdl_image.hash                       | 3 ++-
 package/sdl_net/sdl_net.hash                           | 3 ++-
 package/sdl_sound/sdl_sound.hash                       | 3 ++-
 package/sdl_ttf/sdl_ttf.hash                           | 3 ++-
 package/sdparm/sdparm.hash                             | 3 ++-
 package/sigrok-cli/sigrok-cli.hash                     | 3 ++-
 package/sl/sl.hash                                     | 3 ++-
 package/smack/smack.hash                               | 3 ++-
 package/smartmontools/smartmontools.hash               | 2 ++
 package/smstools3/smstools3.hash                       | 4 +++-
 package/socketcand/socketcand.hash                     | 3 ++-
 package/sofia-sip/sofia-sip.hash                       | 4 +++-
 package/sox/sox.hash                                   | 3 +++
 package/sp-oops-extract/sp-oops-extract.hash           | 3 ++-
 package/spawn-fcgi/spawn-fcgi.hash                     | 4 +++-
 package/sphinxbase/sphinxbase.hash                     | 3 ++-
 package/sredird/sredird.hash                           | 3 ++-
 package/sshfs/sshfs.hash                               | 3 ++-
 package/sshpass/sshpass.hash                           | 1 +
 package/start-stop-daemon/start-stop-daemon.hash       | 4 +++-
 package/startup-notification/startup-notification.hash | 3 ++-
 package/statserial/statserial.hash                     | 3 ++-
 package/stress/stress.hash                             | 4 +++-
 package/sunxi-tools/sunxi-tools.hash                   | 3 ++-
 package/supertux/supertux.hash                         | 4 +++-
 package/sysprof/sysprof.hash                           | 3 ++-
 package/systemd-bootchart/systemd-bootchart.hash       | 3 ++-
 34 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/boot/syslinux/syslinux.hash b/boot/syslinux/syslinux.hash
index 5303f4df0b..9bec3a20e7 100644
--- a/boot/syslinux/syslinux.hash
+++ b/boot/syslinux/syslinux.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/boot/syslinux/sha256sums.asc
-sha256	26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e	syslinux-6.03.tar.xz
+sha256  26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e  syslinux-6.03.tar.xz
+# Locally computed
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
index 6694456763..8a20d42bee 100644
--- a/package/scrypt/scrypt.hash
+++ b/package/scrypt/scrypt.hash
@@ -1,2 +1,4 @@
 # From http://www.tarsnap.com/scrypt/scrypt-sigs-1.2.0.asc
-sha256 1754bc89405277c8ac14220377a4c240ddc34b1ce70882aa92cd01bfdc8569d4  scrypt-1.2.0.tgz
+sha256  1754bc89405277c8ac14220377a4c240ddc34b1ce70882aa92cd01bfdc8569d4  scrypt-1.2.0.tgz
+# Locally computed
+sha256  e9d3ce691acc974c05d54bdea919fa03018fcdb5abd82eab5cdb78f07c451e0a  main.c
diff --git a/package/sdl2_gfx/sdl2_gfx.hash b/package/sdl2_gfx/sdl2_gfx.hash
index 3eb62ee366..190c997d36 100644
--- a/package/sdl2_gfx/sdl2_gfx.hash
+++ b/package/sdl2_gfx/sdl2_gfx.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 63e0e01addedc9df2f85b93a248f06e8a04affa014a835c2ea34bfe34e576262  SDL2_gfx-1.0.4.tar.gz
+sha256  63e0e01addedc9df2f85b93a248f06e8a04affa014a835c2ea34bfe34e576262  SDL2_gfx-1.0.4.tar.gz
+sha256  ec9036525fe1adde787041cce6c4b7fbb262863c238bb9051037e29a57e27bfc  COPYING
+sha256  18e6fad60b809b0e30bd2576a0d33c179ca2ac694504a849d05b6579e3c481dd  SDL2_framerate.h
diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
index 48bc887a4b..441d0124e4 100644
--- a/package/sdl2_mixer/sdl2_mixer.hash
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f  SDL2_mixer-2.0.1.tar.gz
+sha256  5a24f62a610249d744cbd8d28ee399d8905db7222bf3bdbc8a8b4a76e597695f  SDL2_mixer-2.0.1.tar.gz
+sha256  4fc74d216e009c7cc5d939b688fc122b329787dcd24f69ae2a08ce052c826b39  COPYING.txt
diff --git a/package/sdl2_net/sdl2_net.hash b/package/sdl2_net/sdl2_net.hash
index c5f4433837..a58e3c96cf 100644
--- a/package/sdl2_net/sdl2_net.hash
+++ b/package/sdl2_net/sdl2_net.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21  SDL2_net-2.0.1.tar.gz
+sha256  15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21  SDL2_net-2.0.1.tar.gz
+sha256  f09845a238245402a8b8388db6634d8a5b2c3e1dc098f16f9d8c74a276ef4594  COPYING.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 1e83941758..16459e4a59 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
+sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
+sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
diff --git a/package/sdl_gfx/sdl_gfx.hash b/package/sdl_gfx/sdl_gfx.hash
index 8c2be96fff..afd4653667 100644
--- a/package/sdl_gfx/sdl_gfx.hash
+++ b/package/sdl_gfx/sdl_gfx.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/sdlgfx/files/
 md5	fcc3c4f2d1b4943409bf7e67dd65d03a	SDL_gfx-2.0.23.tar.gz
 sha1	aae60e7fed539f3f8a0a0bd6da3bbcf625642596	SDL_gfx-2.0.23.tar.gz
+# Locally computed
+sha256  4f5df842266c59b2d7e6ef35b53d7f37b13795d93baf3ed211f502c216f7bc89  COPYING
+sha256  5f3bc98e0bd2de83279bd62868d4bc0c2b4f811ab828b036d36a4a6d1cd5672d  LICENSE
diff --git a/package/sdl_image/sdl_image.hash b/package/sdl_image/sdl_image.hash
index 836223489c..90e3040a17 100644
--- a/package/sdl_image/sdl_image.hash
+++ b/package/sdl_image/sdl_image.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699	SDL_image-1.2.12.tar.gz
+sha256  0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699  SDL_image-1.2.12.tar.gz
+sha256  653649692218d56e5807bdc5b72f51aa6067bc44d30b757e18c03b32bcaf98da  COPYING
diff --git a/package/sdl_net/sdl_net.hash b/package/sdl_net/sdl_net.hash
index 56a7484284..4f2e1ae76a 100644
--- a/package/sdl_net/sdl_net.hash
+++ b/package/sdl_net/sdl_net.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4	SDL_net-1.2.8.tar.gz
+sha256  5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4  SDL_net-1.2.8.tar.gz
+sha256  e542f822a6cd82deccf82cf0f50192917b0158d725a6bc6348ab1ccdd890ecbe  COPYING
diff --git a/package/sdl_sound/sdl_sound.hash b/package/sdl_sound/sdl_sound.hash
index a548627916..1ea76b0b0b 100644
--- a/package/sdl_sound/sdl_sound.hash
+++ b/package/sdl_sound/sdl_sound.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	3999fd0bbb485289a52be14b2f68b571cb84e380cc43387eadf778f64c79e6df	SDL_sound-1.0.3.tar.gz
+sha256  3999fd0bbb485289a52be14b2f68b571cb84e380cc43387eadf778f64c79e6df  SDL_sound-1.0.3.tar.gz
+sha256  2a781dd2f8c5435c59cfa3b79dfea1c1d7df676ed318ecc802139f76ac345d07  COPYING
diff --git a/package/sdl_ttf/sdl_ttf.hash b/package/sdl_ttf/sdl_ttf.hash
index ac7d6a6be0..86a15d6dd4 100644
--- a/package/sdl_ttf/sdl_ttf.hash
+++ b/package/sdl_ttf/sdl_ttf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7	SDL_ttf-2.0.11.tar.gz
+sha256  724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7  SDL_ttf-2.0.11.tar.gz
+sha256  b609721d3d4ac67facaf86f068c8b311b6c5f6cef89b6d84268aa38b7867ab7b  COPYING
diff --git a/package/sdparm/sdparm.hash b/package/sdparm/sdparm.hash
index 050785ab71..22d6b5b87b 100644
--- a/package/sdparm/sdparm.hash
+++ b/package/sdparm/sdparm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	7dc9e148cef22744e00809dad21b59ac544e3615001bc1b2399978f73e1d58ca	sdparm-1.10.tar.xz
+sha256  7dc9e148cef22744e00809dad21b59ac544e3615001bc1b2399978f73e1d58ca  sdparm-1.10.tar.xz
+sha256  4f98444e14adb18a94a65c3ded5f0dad42d382c6a2288b593a2d5bd5ecc4f46d  COPYING
diff --git a/package/sigrok-cli/sigrok-cli.hash b/package/sigrok-cli/sigrok-cli.hash
index 42bbdc185e..63a3dd80aa 100644
--- a/package/sigrok-cli/sigrok-cli.hash
+++ b/package/sigrok-cli/sigrok-cli.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c	sigrok-cli-0.7.0.tar.gz
+sha256  5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c  sigrok-cli-0.7.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sl/sl.hash b/package/sl/sl.hash
index be74670ffb..908b1bd91e 100644
--- a/package/sl/sl.hash
+++ b/package/sl/sl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1e5996757f879c81f202a18ad8e982195cf51c41727d3fea4af01fdcbbb5563a  sl-5.02.tar.gz
+sha256  1e5996757f879c81f202a18ad8e982195cf51c41727d3fea4af01fdcbbb5563a  sl-5.02.tar.gz
+sha256  72c7d262e2c9ddf019edc90af852a01a410338efff4e75e1c005b77ada4be7c4  LICENSE
diff --git a/package/smack/smack.hash b/package/smack/smack.hash
index 2c1f446250..a753f93fb7 100644
--- a/package/smack/smack.hash
+++ b/package/smack/smack.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 1a607da3b1a661dc76b7a5b8571f4a2d56b4d61d78376088d19f2d8637dc6822  smack-1.3.1.tar.gz
+sha256  1a607da3b1a661dc76b7a5b8571f4a2d56b4d61d78376088d19f2d8637dc6822  smack-1.3.1.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index 2f2b7aa096..ffa1e8f97e 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.5/
 md5	093aeec3f8f39fa9a37593c4012d3156	smartmontools-6.5.tar.gz
 sha1	7e788b429534a4ae627858fbcc826b93402cee7e	smartmontools-6.5.tar.gz
+# Locally computed
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smstools3/smstools3.hash b/package/smstools3/smstools3.hash
index b0b521f747..9eb73e9380 100644
--- a/package/smstools3/smstools3.hash
+++ b/package/smstools3/smstools3.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59	smstools3-3.1.15.tar.gz
+sha256  ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59  smstools3-3.1.15.tar.gz
+sha256  61ae4d83c30236cc7df40b1ccbbe6be07d334f9579b8d0facecc34334fe15b61  doc/license.html
+sha256  786b4da4dd900cad87a7dc17769458607bdeae575d62e6e98ad7144e9225f8d3  LICENSE
diff --git a/package/socketcand/socketcand.hash b/package/socketcand/socketcand.hash
index 6b19c70524..6ee0c314a8 100644
--- a/package/socketcand/socketcand.hash
+++ b/package/socketcand/socketcand.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 3c5cc7af4ff707ac344e62d2e37a74b59aeccd14b88e837cc142c52b69d64a39 socketcand-69e2201222f015a1abe7a58ecf61325012cd91b1.tar.gz
+sha256  3c5cc7af4ff707ac344e62d2e37a74b59aeccd14b88e837cc142c52b69d64a39  socketcand-69e2201222f015a1abe7a58ecf61325012cd91b1.tar.gz
+sha256  b32028a4080be38208ee951c6e8afc6f3bfb3d5496559b260ab0dce9472740f6  socketcand.c
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index fe9c4b11c2..6e81ec878f 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 2b01bc2e1826e00d1f7f57d29a2854b15fd5fe24695e47a14a735d195dd37c81 sofia-sip-1.12.11.tar.gz
+sha256  2b01bc2e1826e00d1f7f57d29a2854b15fd5fe24695e47a14a735d195dd37c81  sofia-sip-1.12.11.tar.gz
+sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
+sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index 2f8069b69f..1a4a7dbf7f 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/sox/files/sox/14.4.2/
 md5	ba804bb1ce5c71dd484a102a5b27d0dd	sox-14.4.2.tar.bz2
 sha1	dc9668256b9d81ef25d672f14f12ec026b0b4087	sox-14.4.2.tar.bz2
+# Locally computed
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  LICENSE.LGPL
diff --git a/package/sp-oops-extract/sp-oops-extract.hash b/package/sp-oops-extract/sp-oops-extract.hash
index 835bfe8915..666cce784e 100644
--- a/package/sp-oops-extract/sp-oops-extract.hash
+++ b/package/sp-oops-extract/sp-oops-extract.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 85601a569af1f4584db75fad21d3a70e377ce12d1bccad7dbe1112abd3b43d93 sp-oops-extract_0.0.7-1.tar.gz
+sha256  85601a569af1f4584db75fad21d3a70e377ce12d1bccad7dbe1112abd3b43d93  sp-oops-extract_0.0.7-1.tar.gz
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/spawn-fcgi/spawn-fcgi.hash b/package/spawn-fcgi/spawn-fcgi.hash
index c1911e4e9f..b5c5c7423b 100644
--- a/package/spawn-fcgi/spawn-fcgi.hash
+++ b/package/spawn-fcgi/spawn-fcgi.hash
@@ -1,2 +1,4 @@
 # From http://redmine.lighttpd.net/news/9
-sha256	a3cfc7c9581b6ddc31084b379c9160323fa345d357ace6cd2d3d3af3593e2873	spawn-fcgi-1.6.4.tar.bz2
+sha256  a3cfc7c9581b6ddc31084b379c9160323fa345d357ace6cd2d3d3af3593e2873  spawn-fcgi-1.6.4.tar.bz2
+# Locally computed
+sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
index 9fbb6dfd79..433fba685d 100644
--- a/package/sphinxbase/sphinxbase.hash
+++ b/package/sphinxbase/sphinxbase.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64 sphinxbase-5prealpha.tar.gz
+sha256  06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64  sphinxbase-5prealpha.tar.gz
+sha256  26f12e0152a5d58c69904e439761a1b2fbb9267b5f04674dbf93667e3e6dd043  src/libsphinxbase/util/bio.c
diff --git a/package/sredird/sredird.hash b/package/sredird/sredird.hash
index 63a419fc87..1181627a41 100644
--- a/package/sredird/sredird.hash
+++ b/package/sredird/sredird.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	640c47dcd84b3b90640165a38eb336a675fdab06c14c09cae2f4a604cae560d3	sredird-2.2.2.tar.gz
+sha256  640c47dcd84b3b90640165a38eb336a675fdab06c14c09cae2f4a604cae560d3  sredird-2.2.2.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 09ae5d1cfa..a8878e6931 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	7f689174d02e6b7e2631306fda4fb8e6b4483102d1bce82b3cdafba33369ad22	sshfs-2.8.tar.gz
+sha256  7f689174d02e6b7e2631306fda4fb8e6b4483102d1bce82b3cdafba33369ad22  sshfs-2.8.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshpass/sshpass.hash b/package/sshpass/sshpass.hash
index f6e0611c2f..9635a91806 100644
--- a/package/sshpass/sshpass.hash
+++ b/package/sshpass/sshpass.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60  sshpass-1.06.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
index 7ce6cc3663..e5d1d91129 100644
--- a/package/start-stop-daemon/start-stop-daemon.hash
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -1,2 +1,4 @@
 # From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.10.dsc
-sha256	025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5	dpkg_1.18.10.tar.xz
+sha256  025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5  dpkg_1.18.10.tar.xz
+# Locally computed
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/startup-notification/startup-notification.hash b/package/startup-notification/startup-notification.hash
index cadbf98434..474c8bd92c 100644
--- a/package/startup-notification/startup-notification.hash
+++ b/package/startup-notification/startup-notification.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c	startup-notification-0.9.tar.gz
+sha256  c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c  startup-notification-0.9.tar.gz
+sha256  29935974beae046f50da806b5f4e54532401dd7bcfbc696a0b645f4cbcce9dbb  COPYING
diff --git a/package/statserial/statserial.hash b/package/statserial/statserial.hash
index 3cdb17d6c2..ca96b864d9 100644
--- a/package/statserial/statserial.hash
+++ b/package/statserial/statserial.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	40cf3bd506852942aa98f468c90ed4ea66dbd343b93efacd40d617b55caf3967	statserial-1.1.tar.gz
+sha256  40cf3bd506852942aa98f468c90ed4ea66dbd343b93efacd40d617b55caf3967  statserial-1.1.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/stress/stress.hash b/package/stress/stress.hash
index 24cf0431b2..8d14d053fb 100644
--- a/package/stress/stress.hash
+++ b/package/stress/stress.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b stress-1.0.4.tar.gz
+sha256  057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b  stress-1.0.4.tar.gz
+# Locally computed
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index aba3fe6a71..2de26c418b 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-1.4.1.tar.gz
+sha256  da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-1.4.1.tar.gz
+sha256  2b0d4dda4bf8034e1506507a67f80f982131137afe62bf144d248f9faea31da4  LICENSE.md
diff --git a/package/supertux/supertux.hash b/package/supertux/supertux.hash
index 23e2645da6..2b3ca799d7 100644
--- a/package/supertux/supertux.hash
+++ b/package/supertux/supertux.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 c4c3e5fa6f90e87b8c5ad6b22a179e9a9839bf997e7f219e22bbcd1c97223ac0 SuperTux-v0.6.0-Source.tar.gz
+sha256  c4c3e5fa6f90e87b8c5ad6b22a179e9a9839bf997e7f219e22bbcd1c97223ac0  SuperTux-v0.6.0-Source.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
+sha256  35c61f69239ff2f55fe0fa5dee5bad6bff311a07c47fa049552e0973a47c07bb  data/AUTHORS
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 8541ecc1a1..4ce206be0b 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	baf03c6fc01a845c705873e6fc7927aa89539dcda6963f9ec4c8eb4c086a64f1	sysprof-1.2.0.tar.gz
+sha256  baf03c6fc01a845c705873e6fc7927aa89539dcda6963f9ec4c8eb4c086a64f1  sysprof-1.2.0.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/systemd-bootchart/systemd-bootchart.hash b/package/systemd-bootchart/systemd-bootchart.hash
index 40643dbca0..8085883247 100644
--- a/package/systemd-bootchart/systemd-bootchart.hash
+++ b/package/systemd-bootchart/systemd-bootchart.hash
@@ -1,2 +1,3 @@
 # sha256 locally computed
-sha256 f4cb17b21928e36ec27de5c5294dea6ec1de4acd7ee6c56d6ecc75319cbcaefa systemd-bootchart-233.tar.xz
+sha256  f4cb17b21928e36ec27de5c5294dea6ec1de4acd7ee6c56d6ecc75319cbcaefa  systemd-bootchart-233.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
