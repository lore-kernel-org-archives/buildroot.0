From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:28:00 +0200
Subject: [Buildroot] [git commit] utils/scanpypi: include LICENSE.RST to
	supported license files
Message-ID: <20170720202408.B21BD7FAFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caa376001455c8c3ebaaa3e4de2078dc3cce8948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 9abf3c4..02384f2 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -416,8 +416,8 @@ class BuildrootPackage():
             license=', '.join(licenses))
         lines.append(license_line)
 
-        filenames = ['LICENCE', 'LICENSE', 'LICENSE.TXT', 'COPYING',
-		     'COPYING.TXT']
+        filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
+		     'COPYING', 'COPYING.TXT']
         license_files = list(find_file_upper_case(filenames, self.tmp_extract))
         license_files = [license.replace(self.tmp_extract, '')[1:]
                          for license in license_files]
