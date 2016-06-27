From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 21:13:57 +0200
Subject: [Buildroot] [git commit] glibc: bump default to version 2.23
Message-ID: <20160627200251.8B87281F98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b87314aa59520c84dfff9cf047fa2cb6c9afa9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 02cae35..f86822d 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_22
+	default BR2_GLIBC_VERSION_2_23
 
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
