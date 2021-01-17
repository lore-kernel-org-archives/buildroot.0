From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 18:52:06 +0100
Subject: [Buildroot] [PATCH 3/5] package/unzip: add two debian security
 patches
In-Reply-To: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
References: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117175208.366428-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While at it, also update indentation in hash file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unzip/unzip.hash | 40 +++++++++++++++++++++-------------------
 package/unzip/unzip.mk   |  4 +++-
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index d05957d5e2..91cd448e46 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,20 +1,22 @@
 # Locally computed:
-sha256 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37 unzip60.tgz
-sha256 7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b LICENSE
-sha256 66a364d75cea29363768ca6d43dd11b9913a59e42b8da16c4f63516c3e4ce7c1 07-increase-size-of-cfactorstr.patch
-sha256 3a8cfd2702d220c6c119eaf805b018b66460284e585e92adc8a572d190471724 08-allow-greater-hostver-values.patch
-sha256 0a1b23118b2f4a3ed097348ab33050d4f79b3863ab30e6d64ac382589834e3de 09-cve-2014-8139-crc-overflow.patch
-sha256 32b1eda30644c44a8bdb9a02ff08bb2eca107f8eb16dda6992a9b778a0de395e 10-cve-2014-8140-test-compr-eb.patch
-sha256 1f60f6e28b36f3cddb7da64c528cfe29160cefa1232e13bb8a47561f574067a9 11-cve-2014-8141-getzip64data.patch
-sha256 c05885bb48b41603f0893ada88f15c0fae3b3f9f6489f24ad630a400f6271351 12-cve-2014-9636-test-compr-eb.patch
-sha256 788c29727ff0689c3b1828466127758426f6d2c769048aa985950373747c76f3 14-cve-2015-7696.patch
-sha256 e85dab65c3ebf3c4ab3359a4143cfd0efccfd1cac517a4e7bd5f518f41a02b6f 15-cve-2015-7697.patch
-sha256 95dd15d5d9cdf5cea18c357b152930d6d52660599e0fd4907d6405870fdd9fe1 16-fix-integer-underflow-csiz-decrypted.patch
-sha256 ea04cfc8b7ca3b3c03117da0d891870b8c542d26188ef5593fd7e479f4f29f4e 17-restore-unix-timestamps-accurately.patch
-sha256 1872ffdd4d82edd7b1e62c469642bf16a1ca12dd26d41bd3f0b44f0f7602eb63 18-cve-2014-9913-unzip-buffer-overflow.patch
-sha256 60840ea8f5d11a276972fb5b43652cdd49a9ed93b2cc0586ad309bf52104b012 19-cve-2016-9844-zipinfo-buffer-overflow.patch
-sha256 4eabc3faeddd56ebc3d5053486b61f8758d840902725fd555d3472cffb094437 20-cve-2018-1000035-unzip-buffer-overflow.patch
-sha256 df3b0eeea8dcc161a2565e306b5dda13d27de43145e198baaf0eab822321ee7e 21-fix-warning-messages-on-big-files.patch
-sha256 2cf5a89e921da99e883bcde0ea03e2c77ae9185f57efaf35e7d43bc24353cfdc 22-cve-2019-13232-fix-bug-in-undefer-input.patch
-sha256 c8e82c80fc7760f90567118a465e4cfa1b8e5d0a5723f9c70e3d21247e550615 23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
-sha256 37ba0bea723beeb22670babda18bd980368cc6591bc7bd9caa04f62692c7e5ac 24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip60.tgz
+sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
+sha256  66a364d75cea29363768ca6d43dd11b9913a59e42b8da16c4f63516c3e4ce7c1  07-increase-size-of-cfactorstr.patch
+sha256  3a8cfd2702d220c6c119eaf805b018b66460284e585e92adc8a572d190471724  08-allow-greater-hostver-values.patch
+sha256  0a1b23118b2f4a3ed097348ab33050d4f79b3863ab30e6d64ac382589834e3de  09-cve-2014-8139-crc-overflow.patch
+sha256  32b1eda30644c44a8bdb9a02ff08bb2eca107f8eb16dda6992a9b778a0de395e  10-cve-2014-8140-test-compr-eb.patch
+sha256  1f60f6e28b36f3cddb7da64c528cfe29160cefa1232e13bb8a47561f574067a9  11-cve-2014-8141-getzip64data.patch
+sha256  c05885bb48b41603f0893ada88f15c0fae3b3f9f6489f24ad630a400f6271351  12-cve-2014-9636-test-compr-eb.patch
+sha256  788c29727ff0689c3b1828466127758426f6d2c769048aa985950373747c76f3  14-cve-2015-7696.patch
+sha256  e85dab65c3ebf3c4ab3359a4143cfd0efccfd1cac517a4e7bd5f518f41a02b6f  15-cve-2015-7697.patch
+sha256  95dd15d5d9cdf5cea18c357b152930d6d52660599e0fd4907d6405870fdd9fe1  16-fix-integer-underflow-csiz-decrypted.patch
+sha256  ea04cfc8b7ca3b3c03117da0d891870b8c542d26188ef5593fd7e479f4f29f4e  17-restore-unix-timestamps-accurately.patch
+sha256  1872ffdd4d82edd7b1e62c469642bf16a1ca12dd26d41bd3f0b44f0f7602eb63  18-cve-2014-9913-unzip-buffer-overflow.patch
+sha256  60840ea8f5d11a276972fb5b43652cdd49a9ed93b2cc0586ad309bf52104b012  19-cve-2016-9844-zipinfo-buffer-overflow.patch
+sha256  4eabc3faeddd56ebc3d5053486b61f8758d840902725fd555d3472cffb094437  20-cve-2018-1000035-unzip-buffer-overflow.patch
+sha256  df3b0eeea8dcc161a2565e306b5dda13d27de43145e198baaf0eab822321ee7e  21-fix-warning-messages-on-big-files.patch
+sha256  2cf5a89e921da99e883bcde0ea03e2c77ae9185f57efaf35e7d43bc24353cfdc  22-cve-2019-13232-fix-bug-in-undefer-input.patch
+sha256  c8e82c80fc7760f90567118a465e4cfa1b8e5d0a5723f9c70e3d21247e550615  23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
+sha256  37ba0bea723beeb22670babda18bd980368cc6591bc7bd9caa04f62692c7e5ac  24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+sha256  c25fdc17e946e091ec801ad69a56e25c0b73b38c606da95bc602b7d48a46ac3f  25-cve-2019-13232-fix-bug-in-uzbunzip2.patch
+sha256  792ee836836d24ccee26592cb6bb4f4b3ca056c340bf49fc6f9abcfc5a294821  26-cve-2019-13232-fix-bug-in-uzinflate.patch
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 0fb452a248..5efe5bcd09 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -27,6 +27,8 @@ UNZIP_PATCH = \
 	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/21-fix-warning-messages-on-big-files.patch \
 	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
 	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/25-cve-2019-13232-fix-bug-in-uzbunzip2.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-26/debian/patches/26-cve-2019-13232-fix-bug-in-uzinflate.patch
 
 $(eval $(cmake-package))
-- 
2.29.2
