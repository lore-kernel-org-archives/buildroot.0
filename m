From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:37 +0100
Subject: [Buildroot] [git commit] package/xapp*: add license file hashes
Message-ID: <20200203133730.B287A8881A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7a3ca39b6e6e1eb1fa60aa37bedde1115c0d5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_beforelight/xapp_beforelight.hash             | 4 +++-
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash                 | 4 +++-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.hash                     | 4 +++-
 package/x11r7/xapp_luit/xapp_luit.hash                           | 4 +++-
 package/x11r7/xapp_rgb/xapp_rgb.hash                             | 4 +++-
 package/x11r7/xapp_rstart/xapp_rstart.hash                       | 4 +++-
 package/x11r7/xapp_scripts/xapp_scripts.hash                     | 1 +
 package/x11r7/xapp_showfont/xapp_showfont.hash                   | 4 +++-
 package/x11r7/xapp_smproxy/xapp_smproxy.hash                     | 4 +++-
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash               | 4 +++-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash                       | 4 +++-
 package/x11r7/xapp_xconsole/xapp_xconsole.hash                   | 4 +++-
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash                 | 2 ++
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash                   | 4 +++-
 package/x11r7/xapp_xedit/xapp_xedit.hash                         | 2 ++
 package/x11r7/xapp_xf86dga/xapp_xf86dga.hash                     | 2 ++
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash               | 4 +++-
 package/x11r7/xapp_xfs/xapp_xfs.hash                             | 2 ++
 package/x11r7/xapp_xgamma/xapp_xgamma.hash                       | 4 +++-
 package/x11r7/xapp_xgc/xapp_xgc.hash                             | 4 +++-
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash | 1 +
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash                       | 4 +++-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.hash                   | 4 +++-
 package/x11r7/xapp_xmag/xapp_xmag.hash                           | 4 +++-
 package/x11r7/xapp_xmh/xapp_xmh.hash                             | 4 +++-
 package/x11r7/xapp_xsetmode/xapp_xsetmode.hash                   | 1 +
 package/x11r7/xapp_xvidtune/xapp_xvidtune.hash                   | 4 +++-
 27 files changed, 71 insertions(+), 20 deletions(-)

diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.hash b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
index 3586b36844..00aff75779 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.hash
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-January/002131.html
-sha256	8fcab6f15148ca680c0d3da8de7dcb41f8e6a076f442cf8bdcf272be9e348166	beforelight-1.0.5.tar.bz2
+sha256  8fcab6f15148ca680c0d3da8de7dcb41f8e6a076f442cf8bdcf272be9e348166  beforelight-1.0.5.tar.bz2
+# Locally computed
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
index d1d2b65aa9..1a7985f9a5 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-December/002510.html
-sha256	f1ed55093356b78daec2678d22f52d42ec11fe88575562d734396962e626d7f6	fslsfonts-1.0.5.tar.bz2
+sha256  f1ed55093356b78daec2678d22f52d42ec11fe88575562d734396962e626d7f6  fslsfonts-1.0.5.tar.bz2
+# Locally computed
+sha256  fbdfcafb5755565ad688bf3f7f808109d358040ec83ed3de496155105451fdf4  COPYING
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash b/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
index d12e8e5c42..a2f1425afb 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-December/002511.html
-sha256	66cf550326c993e7043f260a8ec4a533a3bf9d8f0e7397a6fe9cca803732e92e	fstobdf-1.0.6.tar.bz2
+sha256  66cf550326c993e7043f260a8ec4a533a3bf9d8f0e7397a6fe9cca803732e92e  fstobdf-1.0.6.tar.bz2
+# Locally computed
+sha256  b76125d919ac2bfbff96955dec98b90729633b2df5fbfa2ad3f2e4376164febb  COPYING
diff --git a/package/x11r7/xapp_luit/xapp_luit.hash b/package/x11r7/xapp_luit/xapp_luit.hash
index 4763b0d917..55537b7f1d 100644
--- a/package/x11r7/xapp_luit/xapp_luit.hash
+++ b/package/x11r7/xapp_luit/xapp_luit.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2012-March/001894.html
-sha256	30b0e787cb07a0f504b70f1d6123930522111ce9d4276f6683a69b322b49c636	luit-1.1.1.tar.bz2
+sha256  30b0e787cb07a0f504b70f1d6123930522111ce9d4276f6683a69b322b49c636  luit-1.1.1.tar.bz2
+# Locally computed
+sha256  20b6a1481d9dafeaa471e2ac497ecc651428e8369cc935b5bd9d0e5b77d78081  COPYING
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.hash b/package/x11r7/xapp_rgb/xapp_rgb.hash
index 2b67bfc8e0..ce05454ce9 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.hash
+++ b/package/x11r7/xapp_rgb/xapp_rgb.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-November/002494.html
-sha256	bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0	rgb-1.0.6.tar.bz2
+sha256  bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0  rgb-1.0.6.tar.bz2
+# Locally computed
+sha256  1d08eb3384f5dedc7735bcfae1aa58cb64643ca9389edce3312b1c3cefbfdaa7  COPYING
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.hash b/package/x11r7/xapp_rstart/xapp_rstart.hash
index 47b735302b..e87424cb45 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.hash
+++ b/package/x11r7/xapp_rstart/xapp_rstart.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-February/002168.html
-sha256	29134e9fdffc8d6ac6904c293b392ba6a493ce571fbd2015485b19a8e4d0ffeb	rstart-1.0.5.tar.bz2
+sha256  29134e9fdffc8d6ac6904c293b392ba6a493ce571fbd2015485b19a8e4d0ffeb  rstart-1.0.5.tar.bz2
+# Locally computed
+sha256  7561fa083e87cd511669d8725ebe89dde6cd4f72cdea35b817262dc6ad6fbe9a  COPYING
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.hash b/package/x11r7/xapp_scripts/xapp_scripts.hash
index 79a43180c5..cc561eb2d3 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.hash
+++ b/package/x11r7/xapp_scripts/xapp_scripts.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  1b154b4359302ca499818c45396325aef9ff364d6ff4ce5c3769e4803994a136  scripts-1.0.1.tar.bz2
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.hash b/package/x11r7/xapp_showfont/xapp_showfont.hash
index 0fff9ce01a..ff35e9c9eb 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.hash
+++ b/package/x11r7/xapp_showfont/xapp_showfont.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-December/002513.html
-sha256	e9735c1c530b8a52edfab7415cc0fd7f8d2889095114f4cb689a27476461ac89	showfont-1.0.5.tar.bz2
+sha256  e9735c1c530b8a52edfab7415cc0fd7f8d2889095114f4cb689a27476461ac89  showfont-1.0.5.tar.bz2
+# Locally computed
+sha256  c32217021e0507207e2ee6da3fcee3d9e32816003a7153b3357c08cdc97934a8  COPYING
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.hash b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
index 7bb7bdb3da..db9dd27af3 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.hash
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002564.html
-sha256	6cf19155a2752237f36dbf8bc4184465ea190d2652f887faccb4e2a6ebf77266	smproxy-1.0.6.tar.bz2
+sha256  6cf19155a2752237f36dbf8bc4184465ea190d2652f887faccb4e2a6ebf77266  smproxy-1.0.6.tar.bz2
+# Locally computed
+sha256  92dce6d8a1fcc0c6b5e56dc44e431e7f73bfa2ed5e83295662aa314067a671d8  COPYING
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
index 682c1f35da..ef45b92891 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-September/002299.html
-sha256	9c0e0a1f4f1d49f73c6cf3ccd27b5ca0e18afc63679f1a1ee466b1d82446ebb5	xclipboard-1.1.3.tar.bz2
+sha256  9c0e0a1f4f1d49f73c6cf3ccd27b5ca0e18afc63679f1a1ee466b1d82446ebb5  xclipboard-1.1.3.tar.bz2
+# Locally computed
+sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
index cc5bbcd07c..75a07f36ab 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002567.html
-sha256	e5585361bb8b6a05bb814a8d0e444ee93e0f00180881d3070aff4571e97f67c6	xcmsdb-1.0.5.tar.bz2
+sha256  e5585361bb8b6a05bb814a8d0e444ee93e0f00180881d3070aff4571e97f67c6  xcmsdb-1.0.5.tar.bz2
+# Locally computed
+sha256  c3bd4ac91beb08fee5272b17a3ddee8d2791cc5eaee5bce5271042a45fa4fa6a  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index 364cdbe405..5d6c2ac82f 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002774.html
-sha256 d1144882df207378381bc83927906559defbf7b83a01d52c50ad44234c5851e0  xconsole-1.0.7.tar.bz2
+sha256  d1144882df207378381bc83927906559defbf7b83a01d52c50ad44234c5851e0  xconsole-1.0.7.tar.bz2
+# Locally computed
+sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
index 8fbe8b00eb..88b8438218 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2010-October/001514.html
 sha1	281bee72116311e2d8393ae53ea832e9d267eded	xdbedizzy-1.1.0.tar.bz2
+# Locally computed
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
index 7f9c4f5482..eb02eaeda7 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002569.html
-sha256	30238ed915619e06ceb41721e5f747d67320555cc38d459e954839c189ccaf51	xdpyinfo-1.3.2.tar.bz2
+sha256  30238ed915619e06ceb41721e5f747d67320555cc38d459e954839c189ccaf51  xdpyinfo-1.3.2.tar.bz2
+# Locally computed
+sha256  49733ead65fdfa1da0d176f9b965cc08dae74d73d66c9606488d52f6fc036abf  COPYING
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.hash b/package/x11r7/xapp_xedit/xapp_xedit.hash
index 5aedfb74c4..e521e00821 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.hash
+++ b/package/x11r7/xapp_xedit/xapp_xedit.hash
@@ -1,3 +1,5 @@
 # From http://lists.x.org/archives/xorg-announce/2015-February/002535.html
 sha1	f37b5d0f8ec461955f0419dbb1890d8cf63d179d				xedit-1.2.2.tar.bz2
 sha256	69aa42885dfc06332ca22eb01cc7187e49206e6d65b74113a8ee4cc345fc2927	xedit-1.2.2.tar.bz2
+# Locally computed
+sha256  6d3e4092277ea08fc6b3180dba061120ea53ee965afb84fce16f8ab3d35bb47a  COPYING
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash b/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
index b0c803e9ce..1a82db9ffe 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2010-October/001515.html
 sha1	030659e3728f5f7142e1cf727f147aceeabe4b9e	xf86dga-1.0.3.tar.bz2
+# Locally computed
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash
index 9263e46303..55091ad204 100644
--- a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash
+++ b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002573.html
-sha256	5626bda27c7faa5cbe289a17f8552538fff08a96d542b85efdda1804ccf8a01f	xfindproxy-1.0.4.tar.bz2
+sha256  5626bda27c7faa5cbe289a17f8552538fff08a96d542b85efdda1804ccf8a01f  xfindproxy-1.0.4.tar.bz2
+# Locally computed
+sha256  373984cd13212f3e2fbbcdf88694fd1f5a3658ed9184a6ac44f686fc2e8620f2  COPYING
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.hash b/package/x11r7/xapp_xfs/xapp_xfs.hash
index 27577ba2bd..22ec25a1b4 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.hash
+++ b/package/x11r7/xapp_xfs/xapp_xfs.hash
@@ -3,3 +3,5 @@ md5  b4d2e644bfb35cae8858d2411501b07e  xfs-1.2.0.tar.bz2
 sha1 00848fcc2915ed8b00e75ac311c4727327324f57  xfs-1.2.0.tar.bz2
 sha256 db2212115783498f8eeaaee1349461d6c4e9d2005e142bacd3a984fe57269860  xfs-1.2.0.tar.bz2
 sha512 557b08aa07919239ce345d60b288b886640200bb1a59649fc890c3ccaa8559cc6745189614e696ab1b390ec024b393be5493787b7b0d2b3545b342d743c2e0ef  xfs-1.2.0.tar.bz2
+# Locally computed
+sha256 0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.hash b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
index 30480aadd8..0031450c4d 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.hash
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002574.html
-sha256	0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3	xgamma-1.0.6.tar.bz2
+sha256  0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3  xgamma-1.0.6.tar.bz2
+# Locally computed
+sha256  78d354d348feaaab8d67a220e84137ec24fece04af4dface2e67132c72e216a2  COPYING
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
index 7972a6fd3b..50e1362b64 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.hash
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002575.html
-sha256	14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e	xgc-1.0.5.tar.bz2
+sha256  14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e  xgc-1.0.5.tar.bz2
+# Locally computed
+sha256  13ebeb3e59e406064d46e94a707ed5ec5d8d2bf840971265dd46db0850d22d02  COPYING
diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
index c2d439fed6..b8fcaed039 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971  xinput_calibrator-0.7.5.tar.gz
+sha256  ba6f260bba7d9640cfedfde3a6ae1790583ab8b9ee7c547233ecc0a214d1a6d3  COPYING
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
index b350d295d7..c3cf2f32b2 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002577.html
-sha256	2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a	xkbevd-1.1.4.tar.bz2
+sha256  2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a  xkbevd-1.1.4.tar.bz2
+# Locally computed
+sha256  38c6dbf8f88b1c920561ff3a4d1ffdb85c069c664f5f8b64a9adb477ef347b7c  COPYING
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
index 6660304602..2f8dbc7c1e 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-February/002162.html
-sha256	d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130	xkbutils-1.0.4.tar.bz2
+sha256  d2a18ab90275e8bca028773c44264d2266dab70853db4321bdbc18da75148130  xkbutils-1.0.4.tar.bz2
+# Locally computed
+sha256  3d67b53c085de6d475705b60855b9277afac5d4c4ec531d0ffd1ef0d00571594  COPYING
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.hash b/package/x11r7/xapp_xmag/xapp_xmag.hash
index ccfeb32b64..55a9d479d0 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.hash
+++ b/package/x11r7/xapp_xmag/xapp_xmag.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002581.html
-sha256	87a2bc23b251e2d8f8370d3283a4d6c8dac98a30cb5749a04336cdb55c14e161	xmag-1.0.6.tar.bz2
+sha256  87a2bc23b251e2d8f8370d3283a4d6c8dac98a30cb5749a04336cdb55c14e161  xmag-1.0.6.tar.bz2
+# Locally computed
+sha256  ef8744e617719339c4934579f8558ee4a5aec4396bebd6af02562b63a7c16d27  COPYING
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.hash b/package/x11r7/xapp_xmh/xapp_xmh.hash
index 0358b3d95a..1dadc34586 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.hash
+++ b/package/x11r7/xapp_xmh/xapp_xmh.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002582.html
-sha256	b92f4f912a5fb6346d52cc2b639aea087b347f3b2e4e1a4fc7a165b1345f5689	xmh-1.0.3.tar.bz2
+sha256  b92f4f912a5fb6346d52cc2b639aea087b347f3b2e4e1a4fc7a165b1345f5689  xmh-1.0.3.tar.bz2
+# Locally computed
+sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.hash b/package/x11r7/xapp_xsetmode/xapp_xsetmode.hash
index c393ad4dfc..5d4e164589 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.hash
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  988b47cd922991c6e6adbce15dc386ac75690b61744b526c3af5a4eaa9afa0aa  xsetmode-1.0.0.tar.bz2
+sha256  8f22998f14924220f0f530660811d24e5371a8d7672287c9d22f1eafb7256863  COPYING
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
index 5c9e25484f..ecf7d0330b 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-January/002129.html
-sha256	24e5e103933a04bfb2e1d18562619ed74031ab515e7343eb546bacdbcbeecf01	xvidtune-1.0.3.tar.bz2
+sha256  24e5e103933a04bfb2e1d18562619ed74031ab515e7343eb546bacdbcbeecf01  xvidtune-1.0.3.tar.bz2
+# Locally computed
+sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
