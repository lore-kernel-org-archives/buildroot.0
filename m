From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:55 -0500
Subject: [Buildroot] [PATCH 10/14] package/glibc: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-10-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/glibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 57a2e83..63dd0f4 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_GLIBC
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
 	select BR2_TOOLCHAIN_HAS_SSP
-
+	help
+	  https://www.gnu.org/software/libc/
 endif
-- 
1.9.1
