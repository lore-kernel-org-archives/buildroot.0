From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:05 +0100
Subject: [Buildroot] [PATCH 15/32] package/m*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-16-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash                     | 3 ++-
 package/macchanger/macchanger.hash                          | 2 ++
 package/make/make.hash                                      | 4 +++-
 package/matchbox-common/matchbox-common.hash                | 2 ++
 package/matchbox-desktop/matchbox-desktop.hash              | 2 ++
 package/matchbox-fakekey/matchbox-fakekey.hash              | 2 ++
 package/matchbox-keyboard/matchbox-keyboard.hash            | 2 ++
 package/matchbox-lib/matchbox-lib.hash                      | 2 ++
 package/matchbox-panel/matchbox-panel.hash                  | 2 ++
 .../matchbox-startup-monitor/matchbox-startup-monitor.hash  | 2 ++
 package/mcrypt/mcrypt.hash                                  | 1 +
 package/memstat/memstat.hash                                | 2 ++
 package/memtest86/memtest86.hash                            | 3 ++-
 package/memtester/memtester.hash                            | 3 ++-
 package/metacity/metacity.hash                              | 5 ++++-
 package/micropython-lib/micropython-lib.hash                | 3 ++-
 package/midori/midori.hash                                  | 3 +++
 package/mii-diag/mii-diag.hash                              | 6 ++++--
 package/mimic/mimic.hash                                    | 3 ++-
 package/minidlna/minidlna.hash                              | 4 +++-
 package/miraclecast/miraclecast.hash                        | 6 +++++-
 package/mksh/mksh.hash                                      | 4 +++-
 package/modplugtools/modplugtools.hash                      | 1 +
 package/mongrel2/mongrel2.hash                              | 3 ++-
 package/mono-gtksharp3/mono-gtksharp3.hash                  | 5 ++++-
 package/mp4v2/mp4v2.hash                                    | 2 ++
 package/mpir/mpir.hash                                      | 3 ++-
 package/mraa/mraa.hash                                      | 3 ++-
 package/msr-tools/msr-tools.hash                            | 3 ++-
 package/mtdev2tuio/mtdev2tuio.hash                          | 3 ++-
 package/musepack/musepack.hash                              | 5 ++++-
 31 files changed, 75 insertions(+), 19 deletions(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index 9324dd21c3..ec2fe6ed37 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 39dcc8baccb82cbc746d8f82ce7f673e1b1236e8aee0d09e7ab12c27eeb6ecda mv-ddr-marvell-618dadd1491eb2f7b2fd74313c04f7accddae475.tar.gz
+sha256  39dcc8baccb82cbc746d8f82ce7f673e1b1236e8aee0d09e7ab12c27eeb6ecda  mv-ddr-marvell-618dadd1491eb2f7b2fd74313c04f7accddae475.tar.gz
+sha256  69208236fc322026920b92d1d839ebdc521ca65379bfdb3368a24945e794fc78  ddr3_init.c
diff --git a/package/macchanger/macchanger.hash b/package/macchanger/macchanger.hash
index ce3a7f569d..dbcfa6cff1 100644
--- a/package/macchanger/macchanger.hash
+++ b/package/macchanger/macchanger.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256  dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf  macchanger-1.7.0.tar.gz
+# Locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/make/make.hash b/package/make/make.hash
index ea2e860512..242cb95643 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,4 +1,6 @@
 # From http://lists.gnu.org/archive/html/info-gnu/2016-06/msg00005.html
 md5 15b012617e7c44c0ed482721629577ac  make-4.2.1.tar.bz2
 # Locally calculated after checking signature
-sha256 d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589  make-4.2.1.tar.bz2
+sha256  d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589  make-4.2.1.tar.bz2
+# Locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/matchbox-common/matchbox-common.hash b/package/matchbox-common/matchbox-common.hash
index 619d8473c0..b4aa42a15e 100644
--- a/package/matchbox-common/matchbox-common.hash
+++ b/package/matchbox-common/matchbox-common.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-common/0.9/matchbox-common-0.9.1.tar.bz2.md5
 md5	8e8ba0ee170a9ac78fdc583b00ccf76b	matchbox-common-0.9.1.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-desktop/matchbox-desktop.hash b/package/matchbox-desktop/matchbox-desktop.hash
index e48a4a955c..0673e8e10f 100644
--- a/package/matchbox-desktop/matchbox-desktop.hash
+++ b/package/matchbox-desktop/matchbox-desktop.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/0.9/matchbox-desktop-0.9.1.tar.bz2.md5
 md5	3335a30b1a1aacfb39f23b505254765c	matchbox-desktop-0.9.1.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
index 3e8778a6e1..516e0b6362 100644
--- a/package/matchbox-fakekey/matchbox-fakekey.hash
+++ b/package/matchbox-fakekey/matchbox-fakekey.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/libfakekey/0.1/libfakekey-0.1.tar.bz2.md5
 md5	83dbde4d77e8baf0176fe4291d8a2303	libfakekey-0.1.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
index 76997b0da3..c65fbecff4 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.hash
+++ b/package/matchbox-keyboard/matchbox-keyboard.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/0.1/matchbox-keyboard-0.1.tar.bz2.md5
 md5	50940321d59fee23b38a4941100abf25	matchbox-keyboard-0.1.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index 6f3a6531ee..d48fb32043 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/1.9/libmatchbox-1.9.tar.bz2.md5
 md5	9f73e7515cc4679171a5db180dc1343b	libmatchbox-1.9.tar.bz2
+# Locally computed
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/matchbox-panel/matchbox-panel.hash b/package/matchbox-panel/matchbox-panel.hash
index 82802a9982..5e72b9ec8f 100644
--- a/package/matchbox-panel/matchbox-panel.hash
+++ b/package/matchbox-panel/matchbox-panel.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/matchbox-panel/0.9/matchbox-panel-0.9.3.tar.bz2.md5
 md5	56d1807636f3919e22e51896ab7ccd2e	matchbox-panel-0.9.3.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/matchbox-startup-monitor/matchbox-startup-monitor.hash b/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
index b08e228912..c1b5098e92 100644
--- a/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
+++ b/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/matchbox/mb-applet-startup-monitor/0.1/mb-applet-startup-monitor-0.1.tar.bz2.md5
 md5	ea4b3c1ebee3f731b77a2d4bf8e9aa3c	mb-applet-startup-monitor-0.1.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/mcrypt/mcrypt.hash b/package/mcrypt/mcrypt.hash
index cf29eaa9f6..c6c8871f4f 100644
--- a/package/mcrypt/mcrypt.hash
+++ b/package/mcrypt/mcrypt.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5145aa844e54cca89ddab6fb7dd9e5952811d8d787c4f4bf27eb261e6c182098  mcrypt-2.6.8.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/memstat/memstat.hash b/package/memstat/memstat.hash
index f27e7d25f3..9a30e342fb 100644
--- a/package/memstat/memstat.hash
+++ b/package/memstat/memstat.hash
@@ -1,2 +1,4 @@
 # From http://sourceforge.net/projects/memstattool/files/
 sha1	26071dbc30a2796c0503c7d8060a548ca36f8df9	memstat_1.0.tar.gz
+# Locally computed
+sha256  5e5db2a2fab637bbbc5d2400141fcb9f1b4b55540d025c2dc54378dc497cb524  debian/copyright
diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 81ad98e72e..559ae0ac6c 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,2 +1,3 @@
 # locally computed using sha256sum
-sha256	142127b7953fbd829b1057fb64a78d3340c2b771484230a7347e94530a0d9039	memtest86+-5.01.tar.gz
+sha256  142127b7953fbd829b1057fb64a78d3340c2b771484230a7347e94530a0d9039  memtest86+-5.01.tar.gz
+sha256  2e15e2174b86640d7fbfcb62b51d9182062d9db71d66a46e5b01d736c68150ea  README
diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
index 2d9ef3977f..da8c1c02c9 100644
--- a/package/memtester/memtester.hash
+++ b/package/memtester/memtester.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88	memtester-4.3.0.tar.gz
+sha256  f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88  memtester-4.3.0.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/metacity/metacity.hash b/package/metacity/metacity.hash
index 49450160fe..583db0f204 100644
--- a/package/metacity/metacity.hash
+++ b/package/metacity/metacity.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/metacity/2.25/metacity-2.25.1.sha256sum
-sha256	fb2ede4ac02d7da08d3c3323fb76afaf945c8cccc07cb2d3a4b7f44fb49f1c47	metacity-2.25.1.tar.bz2
+sha256  fb2ede4ac02d7da08d3c3323fb76afaf945c8cccc07cb2d3a4b7f44fb49f1c47  metacity-2.25.1.tar.bz2
+
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
index 1ba662ac8d..cbdda23844 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micropython-lib-1.9.3.tar.gz
+sha256  66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micropython-lib-1.9.3.tar.gz
+sha256  baed4196a4310c576c2010f0a49f987a49e63856df7cd45af11cb3571df4bf74  LICENSE
diff --git a/package/midori/midori.hash b/package/midori/midori.hash
index f548c427fb..d8fd1b7a26 100644
--- a/package/midori/midori.hash
+++ b/package/midori/midori.hash
@@ -1,2 +1,5 @@
 # From download link @ http://midori-browser.org/download/source/
 sha1	64c86935028feb5f89d799c2acacaad67764da6f	midori_0.5.11_all_.tar.bz2
+
+# Locally computed
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/mii-diag/mii-diag.hash b/package/mii-diag/mii-diag.hash
index 22c69e3e57..daf06d8e62 100644
--- a/package/mii-diag/mii-diag.hash
+++ b/package/mii-diag/mii-diag.hash
@@ -1,3 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/m/mii-diag/mii-diag_2.11-3.dsc
-sha256	c690e87e6010607593c1cc2ccd5c481eb3be179387220ad445d8ab83d73ad41c	mii-diag_2.11.orig.tar.gz
-sha256	b49fd3e7c0c446a949c3ca246cc441824d7ef5a61530f884756a82b0b2997190	mii-diag_2.11-3.diff.gz
+sha256  c690e87e6010607593c1cc2ccd5c481eb3be179387220ad445d8ab83d73ad41c  mii-diag_2.11.orig.tar.gz
+sha256  b49fd3e7c0c446a949c3ca246cc441824d7ef5a61530f884756a82b0b2997190  mii-diag_2.11-3.diff.gz
+# Locally calculated
+sha256  e4a8bd5101522569381305262e6c0f06284c264092b7bd42d80ae3d3715940f5  mii-diag.c
diff --git a/package/mimic/mimic.hash b/package/mimic/mimic.hash
index 39d016548a..10780d415d 100644
--- a/package/mimic/mimic.hash
+++ b/package/mimic/mimic.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	725003c9972d5b67c49d5ea6a89cb26b63414ff2c7adbbaf9200cf9eb55f80eb  mimic-1.1.0.tar.gz
+sha256  725003c9972d5b67c49d5ea6a89cb26b63414ff2c7adbbaf9200cf9eb55f80eb  mimic-1.1.0.tar.gz
+sha256  c423c1c6d260091d80ee4c00f386a10fea39963a3f1530f2c245f15dd20324ee  COPYING
diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index 5398506c22..608970b1c3 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -2,4 +2,6 @@
 md5 a968d3d84971322471cabda3669cc0f8  minidlna-1.2.1.tar.gz
 sha1 79d0032c7055aefd4c8e5178bc86fbf258d449d2  minidlna-1.2.1.tar.gz
 # Locally computed
-sha256 67388ba23ab0c7033557a32084804f796aa2a796db7bb2b770fb76ac2a742eec  minidlna-1.2.1.tar.gz
+sha256  67388ba23ab0c7033557a32084804f796aa2a796db7bb2b770fb76ac2a742eec  minidlna-1.2.1.tar.gz
+sha256  79146b7f558e56510b9a714ff75318c05ab93aeccfd6597497b9bce212cf92ea  COPYING
+sha256  94876d7886116e176e702b4902bd9f19731a6883db5f229ac2a7058a22aa6529  LICENCE.miniupnpd
diff --git a/package/miraclecast/miraclecast.hash b/package/miraclecast/miraclecast.hash
index 97c68d019d..1ec0b27fd4 100644
--- a/package/miraclecast/miraclecast.hash
+++ b/package/miraclecast/miraclecast.hash
@@ -1,2 +1,6 @@
 # Locally calculated
-sha256 e11440f782519663db367285dd54b53eb5feb78682dac42bd90230222de9f0fd miraclecast-c94be167c85c6ec8badd7ac79e3dea2e0b73225c.tar.gz
+sha256  e11440f782519663db367285dd54b53eb5feb78682dac42bd90230222de9f0fd  miraclecast-c94be167c85c6ec8badd7ac79e3dea2e0b73225c.tar.gz
+sha256  66bdcc8bcbd1d5ee336c4c8e8749ea538e17b0c0e22b0f705025deb1e912a6d3  COPYING
+sha256  8e136a0e16783d79792e6a57a1422a40acea2e18affb5e2cecb858382f8b0a6c  LICENSE_gdhcp
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE_htable
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE_lgpl
diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 872d042cab..4e71a42634 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,2 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
-sha256 3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75  mksh-R57.tgz
+sha256  3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75  mksh-R57.tgz
+# Locally computed
+sha256  4655d87a53a703ead36a52f166f065c23cf58dd02d7b14abd2474f9f49383a16  mksh.1
diff --git a/package/modplugtools/modplugtools.hash b/package/modplugtools/modplugtools.hash
index e29eda90e0..848d640321 100644
--- a/package/modplugtools/modplugtools.hash
+++ b/package/modplugtools/modplugtools.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0122d44ea0513b928cf9d463acc886d08a2664579aa96ddeeb270d5c81193a4e  modplugtools-0.5.3.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mongrel2/mongrel2.hash b/package/mongrel2/mongrel2.hash
index b8f8de3d76..b1db917c57 100644
--- a/package/mongrel2/mongrel2.hash
+++ b/package/mongrel2/mongrel2.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 543553c3082f2b992649a975f6cb7324ae2aea93af05288ea4f2c1262a7f63b2  mongrel2-v1.9.2.tar.bz2
+sha256  543553c3082f2b992649a975f6cb7324ae2aea93af05288ea4f2c1262a7f63b2  mongrel2-v1.9.2.tar.bz2
+sha256  eb6e2a2baa637d06f6aa762886fbc8939934eb5fdb0b3a5b3882f2a61e9a4357  LICENSE
diff --git a/package/mono-gtksharp3/mono-gtksharp3.hash b/package/mono-gtksharp3/mono-gtksharp3.hash
index 4005051b10..706d985159 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.hash
+++ b/package/mono-gtksharp3/mono-gtksharp3.hash
@@ -1,2 +1,5 @@
 # sha256 from https://download.gnome.org/sources/gtk-sharp/2.99/gtk-sharp-2.99.3.sha256sum
-sha256 6440f571416267ae0cb5698071d087b31e3084693fa2c829b1db37ca7ea2c3a2	gtk-sharp-2.99.3.tar.xz
+sha256  6440f571416267ae0cb5698071d087b31e3084693fa2c829b1db37ca7ea2c3a2  gtk-sharp-2.99.3.tar.xz
+
+# Locally computed
+sha256  4b96eca92e6964e89c2faf6a810c9a0214daf6be651fa848fdfbb8cef80c04b1  COPYING
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index d5a49c44ce..d75c1994d9 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,2 +1,4 @@
 # From https://code.google.com/p/mp4v2/downloads/detail?name=mp4v2-2.0.0.tar.bz2
 sha1 193260cfb7201e6ec250137bcca1468d4d20e2f0 mp4v2-2.0.0.tar.bz2
+# Locally computed
+sha256  15e38684c940176e2fc76331a2299d2ab5115ac997078f768ef31b896af69fc5  COPYING
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
index 8320337ebb..71d0c19d12 100644
--- a/package/mpir/mpir.hash
+++ b/package/mpir/mpir.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb	mpir-3.0.0.tar.bz2
+sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
index abe6d9f84a..f2eb73ca74 100644
--- a/package/mraa/mraa.hash
+++ b/package/mraa/mraa.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-0.9.1.tar.gz
+sha256  e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-0.9.1.tar.gz
+sha256  04f8503394c6d01c86538a693f6990fc1debd94119954ff4eae4407fe7c60a8e  COPYING
diff --git a/package/msr-tools/msr-tools.hash b/package/msr-tools/msr-tools.hash
index 18146df51e..51ec1c79c7 100644
--- a/package/msr-tools/msr-tools.hash
+++ b/package/msr-tools/msr-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 9b87245ee091a798184e447066e9e0d7709b7c81f5e6ad55f2b958c1aa50c4a3 msr-tools-1.3.tar.gz
+sha256  9b87245ee091a798184e447066e9e0d7709b7c81f5e6ad55f2b958c1aa50c4a3  msr-tools-1.3.tar.gz
+sha256  98398b08cd0dab9a04115b049758d4a7917af3c74389a4576d26c8a240d38a73  cpuid.c
diff --git a/package/mtdev2tuio/mtdev2tuio.hash b/package/mtdev2tuio/mtdev2tuio.hash
index b0d159cadc..9932e9e180 100644
--- a/package/mtdev2tuio/mtdev2tuio.hash
+++ b/package/mtdev2tuio/mtdev2tuio.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4a6aa319c44478dceaf01a24603690767e56c029a1f0380da0f31eac5a02e10f  mtdev2tuio-e1e7378d86abe751158e743586133022f32fa4d1.tar.gz
+sha256  4a6aa319c44478dceaf01a24603690767e56c029a1f0380da0f31eac5a02e10f  mtdev2tuio-e1e7378d86abe751158e743586133022f32fa4d1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/musepack/musepack.hash b/package/musepack/musepack.hash
index b1bd73ca89..b811edd991 100644
--- a/package/musepack/musepack.hash
+++ b/package/musepack/musepack.hash
@@ -1,4 +1,7 @@
 # From https://www.musepack.net/index.php?pg=src
 md5	754d67be67f713e54baf70fcfdb2817e	musepack_src_r475.tar.gz
 # Calculated based on the hash above
-sha256	a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b	musepack_src_r475.tar.gz
+sha256  a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b  musepack_src_r475.tar.gz
+# Locally computed
+sha256  141f551d8e4f037b7f6bc9136b7d3116c7ae9ec8da10c4f14c07c6dc34bc9aa5  libmpcdec/COPYING
+sha256  0da88639aebbd614151ee52294fa13789f8cd28d9f2e0a56998b89b5c21ddc2b  libmpcenc/quant.c
-- 
2.20.1
