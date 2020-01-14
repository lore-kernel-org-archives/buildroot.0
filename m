From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 23:00:16 +0100
Subject: [Buildroot] [git commit] package/spdlog: disable example
Message-ID: <20200114215026.CFE7F821B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31deb4619a092e7c01c5e02f3c0b32d90ad21f7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SPDLOG_BUILD_EXAMPLES has been renamed SPDLOG_BUILD_EXAMPLE since
version 1.4.0 and
https://github.com/gabime/spdlog/commit/bb0f3839c1e52948f2ecb66e4e0aa79740a30205

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spdlog/spdlog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 315c4ee407..b878170978 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -11,7 +11,7 @@ SPDLOG_LICENSE_FILES = LICENSE
 SPDLOG_DEPENDENCIES = fmt
 SPDLOG_CONF_OPTS += \
 	-DSPDLOG_BUILD_TESTS=OFF \
-	-DSPDLOG_BUILD_EXAMPLES=OFF \
+	-DSPDLOG_BUILD_EXAMPLE=OFF \
 	-DSPDLOG_BUILD_BENCH=OFF \
 	-DSPDLOG_FMT_EXTERNAL=ON
 
