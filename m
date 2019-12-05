From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:09:19 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/oprofile: add an
 upstream URL to Config.in
Message-ID: <20191205210734.2D679880A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77bb8e6dabe53c77c4df4c86b68826e8f3e7186f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c04dab6f6f5ff726aed5f724ffe82ef70551de89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index d99a7e60c8..cce2cfdab8 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -39,6 +39,8 @@ config BR2_PACKAGE_OPROFILE
 	  interrupt handlers, kernel modules, the kernel, shared
 	  libraries, and applications.
 
+	  https://sourceforge.net/projects/oprofile/
+
 comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
