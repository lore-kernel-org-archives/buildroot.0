From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:36 +0100
Subject: [Buildroot] [git commit] package/q*: add license file hashes
Message-ID: <20200203133730.45717888B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cb4d07a0bfbe01911c23bb39ce17426f09d7c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qextserialport/qextserialport.hash             |  1 +
 package/qjson/qjson.hash                               |  3 ++-
 package/qpid-proton/qpid-proton.hash                   |  2 ++
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash           |  3 ++-
 package/qt5/qt5webkit-examples/qt5webkit-examples.hash | 10 ++++++++--
 package/qt5cinex/qt5cinex.hash                         |  5 +++--
 6 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/qextserialport/qextserialport.hash b/package/qextserialport/qextserialport.hash
index 60c0ff3224..198ea022be 100644
--- a/package/qextserialport/qextserialport.hash
+++ b/package/qextserialport/qextserialport.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  23e3b10a8d8a1e2fb071047144222c43d150748ce6670e5d047ba5b0502ad0b2  qextserialport-ada321a9ee463f628e7b781b8ed00ff219152158.tar.gz
+sha256  363f34c4e9ee62df5e88788723beb9d0ad2c62fa36625355f261f7e6d672aaf5  LICENSE.md
diff --git a/package/qjson/qjson.hash b/package/qjson/qjson.hash
index d794b48727..ab22350e61 100644
--- a/package/qjson/qjson.hash
+++ b/package/qjson/qjson.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 e812617477f3c2bb990561767a4cd8b1d3803a52018d4878da302529552610d4 qjson-0.9.0.tar.gz
+sha256  e812617477f3c2bb990561767a4cd8b1d3803a52018d4878da302529552610d4  qjson-0.9.0.tar.gz
+sha256  758a0cd48d2bec59cbd04ab616737b7aa0cdceac87508adbc9468715ac90722b  COPYING.lib
diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
index 8c2cc4f350..1ee72eef7a 100644
--- a/package/qpid-proton/qpid-proton.hash
+++ b/package/qpid-proton/qpid-proton.hash
@@ -1,2 +1,4 @@
 # Hash from: http://www.apache.org/dist/qpid/proton/0.9.1/qpid-proton-0.9.1.tar.gz.sha
 sha1  98008d90acd0d47cbd7ac1572a2bb50b452338ed  qpid-proton-0.9.1.tar.gz
+# Locally computed
+sha256  9fade5e12873678456137b36cfa4a5983c3793836d41c011f2c2abb02ca36a66  LICENSE
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 666cb6ce55..1e56b4eba7 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 07fbc3f5053f55e4ef6566a15b42b74895314b48a0dfd46f0984f96f0fbb3e02  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127.tar.gz
+sha256  07fbc3f5053f55e4ef6566a15b42b74895314b48a0dfd46f0984f96f0fbb3e02  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127.tar.gz
+sha256  de59ec6c939f4c4def79c0a996b3bd5626895fcbd1ae108e7bddb1dac8218381  doc/lgpl.html
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 6e4c090fdd..0d48ecdffa 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,5 +1,11 @@
 # Hash from: https://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-examples-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 2d6ce7146298d03b443cca4390bbfee17c4c0b08a31efcbf9fe0732291a6169e qtwebkit-examples-opensource-src-5.6.3.tar.xz
+sha256  2d6ce7146298d03b443cca4390bbfee17c4c0b08a31efcbf9fe0732291a6169e  qtwebkit-examples-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
-sha256 e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0 qtwebkit-examples-opensource-src-5.9.1.tar.xz
+sha256  e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0  qtwebkit-examples-opensource-src-5.9.1.tar.xz
+
+# Locally computed
+sha256  a3db6c7f3027aa27489c25a2fa259185cdee945780c32e01c60cbfabf4743b6c  LICENSE.LGPLv21
+sha256  04505ee290cbe7b29b3766e00ff81987e84658f620cb43bd6e7bb52ee4234e1b  LICENSE.LGPLv3
+sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
+sha256  d3d9052b838761dbe00067168ed9ebc437734d53ebf71dea1c8e9f7532a5333b  LICENSE.GPLv3
diff --git a/package/qt5cinex/qt5cinex.hash b/package/qt5cinex/qt5cinex.hash
index 637f388b73..ac62ee2260 100644
--- a/package/qt5cinex/qt5cinex.hash
+++ b/package/qt5cinex/qt5cinex.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256 0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23eef818ccc2b6c60b Qt5_CinematicExperience_rpi_1.0.tgz
-sha256 0e547e0259667915a24e84ade5efdcd0c553f81786734452c2c8dbce19a19f44 Qt5_CinematicExperience_1.0.tgz
+sha256  0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23eef818ccc2b6c60b  Qt5_CinematicExperience_rpi_1.0.tgz
+sha256  0e547e0259667915a24e84ade5efdcd0c553f81786734452c2c8dbce19a19f44  Qt5_CinematicExperience_1.0.tgz
+sha256  bf6206061bcffb43c82999b8845360f223ac5cb4f574219fe95543ffd6755614  README
