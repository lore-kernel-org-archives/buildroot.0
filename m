From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:32:07 +0200
Subject: [Buildroot] [git commit] package/ustr: add hashes for license files
Message-ID: <20190602201237.0174F801CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e832f340165736146081e80424b9f1209e36a156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ustr/ustr.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ustr/ustr.hash b/package/ustr/ustr.hash
index 878c607332..a917b0f18f 100644
--- a/package/ustr/ustr.hash
+++ b/package/ustr/ustr.hash
@@ -1,4 +1,9 @@
 # Locally computed
 sha256 3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e48f331fd99e1fc2c4 ustr-1.0.4.tar.bz2
+sha256 d90681590c012d4bdb2ee98752a6638bbccb4be7a1f1753e9fce86bbb291dc24 LICENSE
+sha256 2a52acaf526a89bb2da713d38328d5fb2e19b1227a14181d4a37c7c188bb05f9 LICENSE_BSD
+sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509 LICENSE_LGPL
+sha256 d7b9a61065e7c63e4854644779d69098b988a3e3d6ef804d41da5f18b69b2fb9 LICENSE_MIT
+
 # From http://debian.gtisc.gatech.edu/debian/pool/main/u/ustr/ustr_1.0.4-6.dsc
 sha256 75aa6be2c70eba632ac63078e55ecb4b5a45e6624501a8ed6d81b9a2014d149e ustr_1.0.4-6.debian.tar.xz
