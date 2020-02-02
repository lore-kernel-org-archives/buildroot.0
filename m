From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:42:55 +0100
Subject: [Buildroot] [PATCH 05/32] package/e*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-6-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/edid-decode/edid-decode.hash       | 3 ++-
 package/elf2flt/elf2flt.hash               | 3 ++-
 package/elftosb/elftosb.hash               | 2 ++
 package/empty/empty.hash                   | 1 +
 package/enchant/enchant.hash               | 2 ++
 package/espeak/espeak.hash                 | 1 +
 package/evemu/evemu.hash                   | 4 +++-
 package/explorercanvas/explorercanvas.hash | 3 ++-
 package/ezxml/ezxml.hash                   | 1 +
 9 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 12cd30e818..e0a9c18523 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 27fcf4c8693ec6fe020b18c78c70ddba9a8b3ea8c55fcfad2a38103128ec5e36 edid-decode-6def7bc83dfb0338632e06a8b14c93faa6af8879.tar.gz
+sha256  27fcf4c8693ec6fe020b18c78c70ddba9a8b3ea8c55fcfad2a38103128ec5e36  edid-decode-6def7bc83dfb0338632e06a8b14c93faa6af8879.tar.gz
+sha256  4b4a7e6d7c358bb5b982eaa84d228cd9e99b75a5fefd3af01272957bf2016b5b  edid-decode.c
diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index 773cf35b77..c4b0697fcd 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 d63baae6fe0d7fcc50a635be151a6f9e1e83dba30568046a869a395c15bf6284  elf2flt-7e33f28df198c46764021ed14408bd262751e148.tar.gz
+sha256  d63baae6fe0d7fcc50a635be151a6f9e1e83dba30568046a869a395c15bf6284  elf2flt-7e33f28df198c46764021ed14408bd262751e148.tar.gz
+sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elftosb/elftosb.hash b/package/elftosb/elftosb.hash
index 2b9f02b14f..83f5ce664e 100644
--- a/package/elftosb/elftosb.hash
+++ b/package/elftosb/elftosb.hash
@@ -1,2 +1,4 @@
 # From http://repository.timesys.com/buildsources/e/elftosb/elftosb-10.12.01/elftosb-10.12.01.tar.gz.md5sum
 md5	e8005d606c1e0bb3507c82f6eceb3056	elftosb-10.12.01.tar.gz
+# locally computed
+sha256  c861c25936b7bc0cf180023d540f2b0d0f5892edd27fd00efef4b6234c1df27a  COPYING
diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index e62939687d..47e9577070 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  7e6636e400856984c4405ce7bd0843aaa3329fa3efd20c58df8400a9eaa35f09  empty-0.6.20b.tgz
+sha256  f01dbe3c624084900b9df1393d9062518b2bc0487acd6a3300ebd6e71352d112  COPYRIGHT
diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index 884a8b59f2..f5709f08ee 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,2 +1,4 @@
 # From http://www.abisource.com/downloads/enchant/1.6.0/MD5SUM
 md5	de11011aff801dc61042828041fb59c7	enchant-1.6.0.tar.gz
+# locally computed
+sha256  d0db934167997c8b8c863af297b3653aa98500bca0a7c05e9c6ec0dabf4f67d4  COPYING.LIB
diff --git a/package/espeak/espeak.hash b/package/espeak/espeak.hash
index 8f4a1ab95b..91feda3ca1 100644
--- a/package/espeak/espeak.hash
+++ b/package/espeak/espeak.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659  espeak-1.48.04-source.zip
+sha256  0bbca7a0ad5da4a6b0677f90d17817984edce7e42d300cae94ae93e4ccba9df7  License.txt
diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index 7d45eb3e5b..13dd402937 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,4 @@
 # From https://lists.freedesktop.org/archives/input-tools/2017-September/001416.html
-sha256 78c9400d55eeeb5ab75161360543f9376438c4da4934cb34cdda5b46021ae379 evemu-2.7.0.tar.xz
+sha256  78c9400d55eeeb5ab75161360543f9376438c4da4934cb34cdda5b46021ae379  evemu-2.7.0.tar.xz
+# locally computed
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/explorercanvas/explorercanvas.hash b/package/explorercanvas/explorercanvas.hash
index 59e8c7a0e3..e47367a21a 100644
--- a/package/explorercanvas/explorercanvas.hash
+++ b/package/explorercanvas/explorercanvas.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 7b8f597b5d3a2f71e87aac413e12e03d852df3dd3ac39f70e1615c9c850217ec  explorercanvas-aa989ea9d9bac748638f7c66b0fc88e619715da6.tar.gz
+sha256  7b8f597b5d3a2f71e87aac413e12e03d852df3dd3ac39f70e1615c9c850217ec  explorercanvas-aa989ea9d9bac748638f7c66b0fc88e619715da6.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/ezxml/ezxml.hash b/package/ezxml/ezxml.hash
index 44d7bbdf9f..bf04b0e00e 100644
--- a/package/ezxml/ezxml.hash
+++ b/package/ezxml/ezxml.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  a68d52257dcb0ff2ad3d71c8c64311edb8030254bb8b581e229aeaba6231cdf9  ezxml-0.8.6.tar.gz
+sha256  e82e49402f6b21176c65eead46dbd39d8f7a3c28b052589d8b307dfc8f78a03f  license.txt
-- 
2.20.1
