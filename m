From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:07 +0100
Subject: [Buildroot] [PATCH 17/32] package/o*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-18-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/odhcploc/odhcploc.hash                   | 1 +
 package/omap-u-boot-utils/omap-u-boot-utils.hash | 1 +
 package/open-plc-utils/open-plc-utils.hash       | 3 ++-
 package/openbox/openbox.hash                     | 1 +
 package/openpgm/openpgm.hash                     | 3 ++-
 package/openpowerlink/openpowerlink.hash         | 3 ++-
 package/oracle-mysql/oracle-mysql.hash           | 4 +++-
 package/ortp/ortp.hash                           | 1 +
 package/owl-linux/owl-linux.hash                 | 1 +
 9 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/odhcploc/odhcploc.hash b/package/odhcploc/odhcploc.hash
index 201339f97c..a1d9a5661f 100644
--- a/package/odhcploc/odhcploc.hash
+++ b/package/odhcploc/odhcploc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  b0360a3aece8a29d131531da7bfc36d57c30c6eed30ff1ea360f7cccea1d62d7  odhcploc-20111021.tar.gz
+sha256  092a5b7be2a7ff088be7ec99adf68629509911b66f304b8ea0c835cdc138d544  COPYING
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.hash b/package/omap-u-boot-utils/omap-u-boot-utils.hash
index 020c4405c9..e61bb812e0 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.hash
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  f9c2553efeff1289b2b964a266a0b4a03a377f84a14d0599a779f6e3d7b75d5f  omap-u-boot-utils-3f07426cddc0be9e24702e7aacc7574ddd7fba28.tar.gz
+sha256  1080312c3230fb7dd32fe807ed8c8cd11f4061bf1a2f065b651630bfe30157b2  COPYING
diff --git a/package/open-plc-utils/open-plc-utils.hash b/package/open-plc-utils/open-plc-utils.hash
index a76630df96..0c3b64b7e7 100644
--- a/package/open-plc-utils/open-plc-utils.hash
+++ b/package/open-plc-utils/open-plc-utils.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 00cd7f71e03849b1d6a96ec040351b819481e2f420cfb246f0b0f02cde73e098 open-plc-utils-1be781d1ea81827e5f6c1a35961c65dd4d15472c.tar.gz
+sha256  00cd7f71e03849b1d6a96ec040351b819481e2f420cfb246f0b0f02cde73e098  open-plc-utils-1be781d1ea81827e5f6c1a35961c65dd4d15472c.tar.gz
+sha256  3137c632bbcec5e88b72dc13f4fe06ee184eea364fec8f7494bdfa57672ef921  LICENSE
diff --git a/package/openbox/openbox.hash b/package/openbox/openbox.hash
index a8696b3f87..c3f9953a99 100644
--- a/package/openbox/openbox.hash
+++ b/package/openbox/openbox.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  abe75855cc5616554ffd47134ad15291fe37ebbebf1a80b69cbde9d670f0e26d  openbox-3.6.1.tar.xz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/openpgm/openpgm.hash b/package/openpgm/openpgm.hash
index 581a223462..472053173c 100644
--- a/package/openpgm/openpgm.hash
+++ b/package/openpgm/openpgm.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 acc1545fd8060aa66b17327110e2859e451cfc685ebd3b2211619728e3471b66  openpgm-5-2-122.tar.gz
+sha256  acc1545fd8060aa66b17327110e2859e451cfc685ebd3b2211619728e3471b66  openpgm-5-2-122.tar.gz
+sha256  4a7d4ec71fa60969399fd4caad64d5a3003fee2775445f271a5a36a8ae743a29  openpgm/pgm/LICENSE
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 13b5e9351e..cd00f902fb 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -2,4 +2,5 @@
 md5	04524d1b1f9946176dce0ccb0eecf537	openPOWERLINK_V2.7.1.tar.gz
 sha1	4ee9c6e26bbc729fdbbb272155b093ffa0d9cefd	openPOWERLINK_V2.7.1.tar.gz
 # sha256 locally computed
-sha256	d0d65f4fb8f2ad209cf9575714f88f33168a1cf71e8f1801e1e1ac4df6a37ffd	openPOWERLINK_V2.7.1.tar.gz
+sha256  d0d65f4fb8f2ad209cf9575714f88f33168a1cf71e8f1801e1e1ac4df6a37ffd  openPOWERLINK_V2.7.1.tar.gz
+sha256  348e31e9e5094104463d58d33abd31049fdf209afbc12ea7abb7fd4b4a147429  license.md
diff --git a/package/oracle-mysql/oracle-mysql.hash b/package/oracle-mysql/oracle-mysql.hash
index bc309ec9a8..9d1c86854f 100644
--- a/package/oracle-mysql/oracle-mysql.hash
+++ b/package/oracle-mysql/oracle-mysql.hash
@@ -1,4 +1,6 @@
 # From https://downloads.mariadb.com/archives/mysql-5.1/mysql-5.1.73.tar.gz.md5
 md5	887f869bcc757957067b9198f707f32f	mysql-5.1.73.tar.gz
 # Locally computed
-sha256 05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5  mysql-5.1.73.tar.gz
+sha256  05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5  mysql-5.1.73.tar.gz
+sha256  cbf0dbf56528a629f4358a1339f981202f1a9a0d9542c092b03f486064ced2db  README
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index c990d96eb3..93ec39297f 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  eb61a833ab3ad80978d7007411240f46e9b2d1034373b9d9dfaac88c1b6ec0af  ortp-0.27.0.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/owl-linux/owl-linux.hash b/package/owl-linux/owl-linux.hash
index 4a5133df47..555d2c2849 100644
--- a/package/owl-linux/owl-linux.hash
+++ b/package/owl-linux/owl-linux.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  a6b1bc6b3900954438a0f1a316bac5f74171125a88c80c35e137f4ca512dedc6  owl-linux-1.0.7.tar.gz
+sha256  092f1698328e0d4cc2d04ef1445207a9d278963284cd709fa88f1b8c9999264b  LICENSE
-- 
2.20.1
