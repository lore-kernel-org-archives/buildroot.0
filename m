From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 21:08:44 +0100
Subject: [Buildroot] [git commit] package/oprofile: fix typo in comment
Message-ID: <20160201224701.B95047F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e0bcda354ef4c54a7d9c6552b6d65bb48fe74a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/oprofile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index c73086e..f27e06e 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -41,7 +41,7 @@ ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
-# When getext is enabled, popt links with -lintl, specifies it in its
+# When gettext is enabled, popt links with -lintl, specifies it in its
 # popt.pc and has done so for the past 6+ years. But oprofile does not
 # use pkconfig to find popt, so misses -lintl, which is important for
 # a static build. We have to do the call to pkgconfig manually...
