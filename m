From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:15 +0100
Subject: [Buildroot] [PATCH 25/32] package/v*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-26-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/v4l2grab/v4l2grab.hash         | 3 ++-
 package/vala/vala.hash                 | 4 +++-
 package/vboot-utils/vboot-utils.hash   | 1 +
 package/vim/vim.hash                   | 3 ++-
 package/vo-aacenc/vo-aacenc.hash       | 1 +
 package/vorbis-tools/vorbis-tools.hash | 4 +++-
 package/vpnc/vpnc.hash                 | 3 ++-
 package/vsftpd/vsftpd.hash             | 4 +++-
 8 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/v4l2grab/v4l2grab.hash b/package/v4l2grab/v4l2grab.hash
index a59c8af320..eba36b5c7a 100644
--- a/package/v4l2grab/v4l2grab.hash
+++ b/package/v4l2grab/v4l2grab.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9a8d0d1ca5ac9fb9f66e00300bb3265d156cf1cb67eb30f6e6637c83b0b507a1 v4l2grab-f8d8844d52387b3db7b8736f5e86156d9374f781.tar.gz
+sha256  9a8d0d1ca5ac9fb9f66e00300bb3265d156cf1cb67eb30f6e6637c83b0b507a1  v4l2grab-f8d8844d52387b3db7b8736f5e86156d9374f781.tar.gz
+sha256  7fa0d45fe86fda646fada21ecfa7672e951b01c521aecd358f586facd65fb5b3  LICENSE.md
diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 48212b22a4..7b3f0c9f76 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,4 @@
 # From https://download.gnome.org/sources/vala/0.34/vala-0.34.7.sha256sum
-sha256 1b2cb14f377d4c41fa3a86d3d01b93017015ce91b6714a85f27346073b4034fa  vala-0.34.7.tar.xz
+sha256  1b2cb14f377d4c41fa3a86d3d01b93017015ce91b6714a85f27346073b4034fa  vala-0.34.7.tar.xz
+# Locally computed
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 4ff6c39807..e2ddf77734 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  d95b64b1f1de4a3ffa5c2e446d7c8e92aa197aee10de24206b2ea2deb5a8b947  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index d85bd7760c..6c68b1bc2b 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 4b7359a58a75c29d4a8fc7fcbb2ccab1d1dc0ede1c4c689b27cc049c17920278 vim-8.1.1929.tar.gz
+sha256  4b7359a58a75c29d4a8fc7fcbb2ccab1d1dc0ede1c4c689b27cc049c17920278  vim-8.1.1929.tar.gz
+sha256  70ab7f93197b29d47bfe4371774c8d904f7842d4843c257d21c29b7ac38d6406  README.txt
diff --git a/package/vo-aacenc/vo-aacenc.hash b/package/vo-aacenc/vo-aacenc.hash
index 822f8424a7..f0d352f82f 100644
--- a/package/vo-aacenc/vo-aacenc.hash
+++ b/package/vo-aacenc/vo-aacenc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36  vo-aacenc-0.1.3.tar.gz
+sha256  8b3f1762349248d444ab9acbafe73941254e36e1064954da56bb9ddbd5873ddb  COPYING
diff --git a/package/vorbis-tools/vorbis-tools.hash b/package/vorbis-tools/vorbis-tools.hash
index 8f40eda9d2..76122be13f 100644
--- a/package/vorbis-tools/vorbis-tools.hash
+++ b/package/vorbis-tools/vorbis-tools.hash
@@ -1,2 +1,4 @@
 # From http://downloads.xiph.org/releases/vorbis/SHA256SUMS
-sha256	a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc	vorbis-tools-1.4.0.tar.gz
+sha256  a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc  vorbis-tools-1.4.0.tar.gz
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/vpnc/vpnc.hash b/package/vpnc/vpnc.hash
index 98a98472e3..f512a77792 100644
--- a/package/vpnc/vpnc.hash
+++ b/package/vpnc/vpnc.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 c10a5c2c0813198ca2404dd36db380cdb6395b46338123b341775095cf61521d  vpnc-b1243d29e0c00312ead038b04a2cf5e2fa31d740.tar.gz
+sha256  c10a5c2c0813198ca2404dd36db380cdb6395b46338123b341775095cf61521d  vpnc-b1243d29e0c00312ead038b04a2cf5e2fa31d740.tar.gz
+sha256  bf3ec1bd1dec31a6ab8980bfd04569f506432f35ee01e88a3910847784bc2de1  COPYING
diff --git a/package/vsftpd/vsftpd.hash b/package/vsftpd/vsftpd.hash
index a0cd55b6d1..955cd30889 100644
--- a/package/vsftpd/vsftpd.hash
+++ b/package/vsftpd/vsftpd.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7	vsftpd-3.0.3.tar.gz
+sha256  9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7  vsftpd-3.0.3.tar.gz
+# Locally computed
+sha256  c9cf119e2f9dbcf187fb805ba5aded105db26a693803636fb7228c98460ffbf2  COPYING
-- 
2.20.1
