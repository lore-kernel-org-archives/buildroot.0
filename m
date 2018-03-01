From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 17:14:01 +0100
Subject: [Buildroot] [git commit] utils/scanpypi: fix 'downloas' typo in
 error message
Message-ID: <20180301161437.03D6F81487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cf95a8a78929e85f1a673134e0ebb9e9433bd5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 55bfb2fedb..c96f1bc892 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -207,7 +207,7 @@ class BuildrootPackage():
         else:
             if download.__class__ == urllib2.HTTPError:
                 raise download
-            raise DownloadFailed('Failed to downloas package {pkg}'
+            raise DownloadFailed('Failed to download package {pkg}'
                                  .format(pkg=self.real_name))
         self.filename = self.used_url['filename']
         self.url = self.used_url['url']
