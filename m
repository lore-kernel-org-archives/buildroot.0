From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 15:39:59 +0100
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.97
Message-ID: <20190125144019.18E2181312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af54cd6270a025648c6261ecea57f9353fee4c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 78b3ef75ac..301866c8b0 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2018-October/193244.html
-md5 f296d87272b1befeada3bb135751ab3d  libdrm-2.4.96.tar.bz2
-sha1 51eb4c248a437b3f200bd1cd84461d3e0b60d71e  libdrm-2.4.96.tar.bz2
-sha256 0d561acf7bb4cc59dc82415100e6c1a44860e8c380e00f9592923e3cd08db393  libdrm-2.4.96.tar.bz2
-sha512 008cb7658d953b44e11fa3cc6e00dfeb3efb59c7fdadd59f7066101aff138acbbc2f2508e9ebe0528340e39dc7693937755d1641816ddde135c10a13e7d81e3b  libdrm-2.4.96.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2019-January/204447.html
+md5 acef22d0c62c89692348c2dd5591393e  libdrm-2.4.97.tar.bz2
+sha1 7635bec769a17edd140282fa2c46838c4a44bc91  libdrm-2.4.97.tar.bz2
+sha256 77d0ccda3e10d6593398edb70b1566bfe1a23a39bd3da98ace2147692eadd123  libdrm-2.4.97.tar.bz2
+sha512 3e08ee9d6c9ce265d783a59b51e22449905ea73aa27f25a082a1e9e1532f7c99e1c9f7cb966eb0970be2a08e2e5993dc9aa55093b1bff548689fdb465e7145ed  libdrm-2.4.97.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 06efa20195..cc7350c10e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.96
+LIBDRM_VERSION = 2.4.97
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
