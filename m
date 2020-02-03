From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:36 +0100
Subject: [Buildroot] [git commit] package/t*: add license file hashes
Message-ID: <20200203133730.76D8988723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa89fadf1ea032dbbdc5aaaf21fd13be3c5ab8da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/targetcli-fb/targetcli-fb.hash | 1 +
 package/taskd/taskd.hash               | 3 ++-
 package/tekui/tekui.hash               | 1 +
 package/ti-gfx/ti-gfx.hash             | 1 +
 package/ti-uim/ti-uim.hash             | 3 ++-
 package/ti-utils/ti-utils.hash         | 1 +
 package/tinyalsa/tinyalsa.hash         | 3 ++-
 package/tinyhttpd/tinyhttpd.hash       | 1 +
 package/triggerhappy/triggerhappy.hash | 3 ++-
 package/tunctl/tunctl.hash             | 3 ++-
 10 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 339e848499..207c38e046 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  0f32ab6f3ecd234280d55be5e89ce2b3a02f9c82c8dccaae66e26464cff8901a  targetcli-fb-2.1.fb41.tar.gz
+sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/taskd/taskd.hash b/package/taskd/taskd.hash
index 41d37bbadb..63bb87c1b6 100644
--- a/package/taskd/taskd.hash
+++ b/package/taskd/taskd.hash
@@ -1,4 +1,5 @@
 # From http://taskwarrior.org/download/
 sha1 ded339deeee65277e4712f71a9159502f8b20b52 taskd-1.1.0.tar.gz
 # Locally calculated
-sha256 7b8488e687971ae56729ff4e2e5209ff8806cf8cd57718bfd7e521be130621b4 taskd-1.1.0.tar.gz
+sha256  7b8488e687971ae56729ff4e2e5209ff8806cf8cd57718bfd7e521be130621b4  taskd-1.1.0.tar.gz
+sha256  84d1a8c2e6e306864ff350857a36b6c74756e61e2eae6822cf2fa88212720f68  COPYING
diff --git a/package/tekui/tekui.hash b/package/tekui/tekui.hash
index 07de2ed6d2..f82e7503fc 100644
--- a/package/tekui/tekui.hash
+++ b/package/tekui/tekui.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  28abfaacc0f2ddae962afbbca862a7fb619c33a99a497be9edd746091013dd7f  tekui-1.12.tgz
+sha256  92cdb348af49efe4c769ccbaeb34a23be084ddda408eace8f1a3a2c5dd4aad14  COPYRIGHT
diff --git a/package/ti-gfx/ti-gfx.hash b/package/ti-gfx/ti-gfx.hash
index d97b559d74..39462e48ed 100644
--- a/package/ti-gfx/ti-gfx.hash
+++ b/package/ti-gfx/ti-gfx.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  54641222cdb49b03f996cbd6412de227198d9e084f5647d706bbf4217e8cdb07  Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin
 sha256  99dae9d33790c87860e828505ac07c5b864ef65d8372b39117704db6b78494ff  Graphics_SDK_setuplinux_softfp_5_01_00_01.bin
+sha256  74cc0f8a7806f685de6fd6c9f6d8453667078db4f2f3b29ab0b244e587bd7265  TSPA.txt
diff --git a/package/ti-uim/ti-uim.hash b/package/ti-uim/ti-uim.hash
index ea64540ba8..9c29b74644 100644
--- a/package/ti-uim/ti-uim.hash
+++ b/package/ti-uim/ti-uim.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 da8a66968f4bf99366ab2b63baf358d937a6b1a5636ef6179c3aa7c852cbd1b2 ti-uim-a0236bc252e6484835ce266ae4a50b361f6a902d.tar.gz
+sha256  da8a66968f4bf99366ab2b63baf358d937a6b1a5636ef6179c3aa7c852cbd1b2  ti-uim-a0236bc252e6484835ce266ae4a50b361f6a902d.tar.gz
+sha256  4e39276507524f938459b05d061ae77562f3f85926fe73027cfcac259cb03d0e  uim.h
diff --git a/package/ti-utils/ti-utils.hash b/package/ti-utils/ti-utils.hash
index 899172e952..0548427fcd 100644
--- a/package/ti-utils/ti-utils.hash
+++ b/package/ti-utils/ti-utils.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  d05d4e3ad3599fca7854109938aebd24bbab72ac7d69dd053260f735a36613f9  ti-utils-06dbdb2727354b5f3ad7c723897f40051fddee49.tar.gz
+sha256  363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index f9be664ca4..d078bab597 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
+sha256  d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
+sha256  ca2b89a68c33fba3c8bcaec96f32907e2ede0eb33688ae61d29ec49732158f6d  NOTICE
diff --git a/package/tinyhttpd/tinyhttpd.hash b/package/tinyhttpd/tinyhttpd.hash
index 73255d5651..fc8ff4ee2c 100644
--- a/package/tinyhttpd/tinyhttpd.hash
+++ b/package/tinyhttpd/tinyhttpd.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  56609b82869c80ba71b2a2af166a0bcaffe21e7412f4594e04b9a5abf733435a  tinyhttpd-0.1.0.tar.gz
+sha256  4289e6d4f7ba72672dbd45ab78a8e02babf3d6e0577eeac5b2ef6926da6f4a87  README
diff --git a/package/triggerhappy/triggerhappy.hash b/package/triggerhappy/triggerhappy.hash
index 5a1d767213..ab736cada3 100644
--- a/package/triggerhappy/triggerhappy.hash
+++ b/package/triggerhappy/triggerhappy.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1b3221963b9adca26eacc5442d8c2422cf2072f8adde1dbd691a69b37a583fb1  triggerhappy-b822888066129350e51ad79f1cf307fa38dae4f7.tar.gz
+sha256  1b3221963b9adca26eacc5442d8c2422cf2072f8adde1dbd691a69b37a583fb1  triggerhappy-b822888066129350e51ad79f1cf307fa38dae4f7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/tunctl/tunctl.hash b/package/tunctl/tunctl.hash
index d3aaeecef8..59a58cdb9d 100644
--- a/package/tunctl/tunctl.hash
+++ b/package/tunctl/tunctl.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff  tunctl-1.5.tar.gz
+sha256  aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff  tunctl-1.5.tar.gz
+sha256  bcd12b6749dbd86c051cc2ef9e838096741602d4db213cc866b1da6cfeda5f16  tunctl.c
