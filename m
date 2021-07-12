From: Bruno Marie <gameblabla@protonmail.com>
Date: Mon, 12 Jul 2021 20:22:35 +0200
Subject: [PATCH 1/1] package/mpg123: Remove disable-lfs-alias
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210712182235.bliwFW03yontDF8n-osN7wFqrGP40_Ozr8ONWH42oOQ@z>

disable-lfs-alias causes undefined references for apps that want to link against mpg123.

Signed-off-by: Bruno Marie <gameblabla@protonmail.com>
---
 package/mpg123/mpg123.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 9aa9cd1c10..7362db2138 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -7,7 +7,7 @@
 MPG123_VERSION = 1.25.15
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
-MPG123_CONF_OPTS = --disable-lfs-alias
+MPG123_CONF_OPTS =
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPL-2.1
 MPG123_LICENSE_FILES = COPYING
--
2.32.0
