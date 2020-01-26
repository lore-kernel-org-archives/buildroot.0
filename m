From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2020 09:07:38 +0100
Subject: [Buildroot] [git commit] package/glibc: add comment about updating
 localedef in sync
Message-ID: <20200126075909.00FBE83B68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8cbe9719025676bc2330b9dfb11e58dc4f427e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
