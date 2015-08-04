From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2015 20:00:36 +0200
Subject: [Buildroot] [PATCH 4/9] docs/manual: document gcc version
	dependencies
In-Reply-To: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1438711241-31792-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the Buildroot manual to document how to detail the
gcc version dependencies in Config.in comments of packages, like we do
for kernel headers version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 8f585d4..b66e447 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -277,6 +277,12 @@ use in the comment.
 ** Comment string: +headers >= X.Y+ and/or `headers <= X.Y` (replace
    +X.Y+ with the proper version)
 
+* GCC version
+** Dependency symbol: +BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y+, (replace
+   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
+** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
+   +X.Y+ with the proper version)
+
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
    +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
-- 
2.5.0
