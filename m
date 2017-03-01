From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:37:51 +0100
Subject: [Buildroot] [git commit] glibc: bump default to version 2.24
Message-ID: <20170301213831.83A6982234@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faebb41d0256513bae2042a87330eab33d78a2da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 85aace6..0442626 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_23
+	default BR2_GLIBC_VERSION_2_24
 
 config BR2_GLIBC_VERSION_2_22
 	bool "2.22"
