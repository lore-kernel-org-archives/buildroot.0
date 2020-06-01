From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 22:43:27 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: cleanup rockwellcollins.com
 maintainers
Message-ID: <20200601204825.080A781F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9740b9bcdd9167195498393098e89915ee564691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88050349db..efb97c739c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -487,9 +487,6 @@ N:	Biagio Montaruli <biagio.hkr@gmail.com>
 F:	board/acmesystems/
 F:	configs/acmesystems_*
 
-N:	Bimal Jacob <bimal.jacob@rockwellcollins.com>
-F:	package/nginx-upload/
-
 N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
@@ -661,9 +658,6 @@ F:	package/openldap/
 N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
-N:	David Graziano <david.graziano@rockwellcollins.com>
-F:	package/libcsv/
-
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
 F:	configs/lego_ev3_defconfig
@@ -1224,11 +1218,6 @@ F:	package/python-pexpect/
 F:	package/python-ptyprocess/
 F:	package/zynq-boot-bin/
 
-N:	Jared Bents <jared.bents@rockwellcollins.com>
-F:	package/davici/
-F:	package/python-filelock/
-F:	package/python-pysftp/
-
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
 
@@ -1659,6 +1648,7 @@ F:	package/cgroupfs-mount/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
+F:	package/davici/
 F:	package/dnsmasq/
 F:	package/dosfstools/
 F:	package/eigen/
@@ -1708,6 +1698,7 @@ F:	package/protobuf-c/
 F:	package/protobuf/
 F:	package/python-bunch/
 F:	package/python-colorama/
+F:	package/python-filelock/
 F:	package/python-flask-cors/
 F:	package/python-iptables/
 F:	package/python-ipy/
@@ -1715,6 +1706,7 @@ F:	package/python-posix-ipc/
 F:	package/python-pycairo/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
+F:	package/python-pysftp/
 F:	package/python-tinyrpc/
 F:	package/python-txdbus/
 F:	package/raptor/
@@ -1925,9 +1917,6 @@ F:	package/openjpeg/
 N:	Olivier Singla <olivier.singla@gmail.com>
 F:	package/shellinabox/
 
-N:	Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
-F:	package/checksec/
-
 N:	Parnell Springmeyer <parnell@digitalmentat.com>
 F:	package/scrypt/
 
