From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Jan 2020 00:49:18 +0100
Subject: [Buildroot] [PATCH 2/2] package/glibc: add comment
In-Reply-To: <20200125234918.24829-1-romain.naour@gmail.com>
References: <20200125234918.24829-1-romain.naour@gmail.com>
Message-ID: <20200125234918.24829-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/glibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e4eb665ed6..2ca73343b3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,6 +16,7 @@ GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
+# When updating the version, please also update localedef
 GLIBC_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
-- 
2.24.1
