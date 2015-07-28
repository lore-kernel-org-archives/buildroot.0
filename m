From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:37:39 +0200
Subject: [Buildroot] [git commit] docs/manual: Modify GitHub FOO_SITE
	explanation
Message-ID: <20150728214010.F357181E4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8d281d816f5c7bf85b3643892b0edd9406dcb4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GitHub has changed its layout, there is no longer any green nor grey
button, it's a link with a tiny icon that indicates if it's uploaded by
the maintainer or not.
In order to not confuse anyone, adding an image should make it clear.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt         |   18 ++++++++++--------
 docs/website/images/github_hash_mongrel2.png |  Bin 0 -> 19029 bytes
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6699951..896be00 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -63,11 +63,13 @@ need to do AUTORECONF).
 
 You can see on the release page if it's an uploaded tarball or a git tag:
 
-- If there is a green download button, like
-  https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2], then it
-  was uploaded by the maintainer and you should use the link of that button to
-  specify +FOO_SITE+, and not use the 'github' helper.
-- If there is grey download button, like
-  https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then it's an
-  automatically generated tarball and you should use the 'github' helper
-  function.
+image::github_hash_mongrel2.png[]
+
+- If it looks like the image above then it was uploaded by the
+  maintainer and you should use that link (in that example:
+  'mongrel2-v1.9.2.tar.bz2') to specify +FOO_SITE+, and not use the
+  'github' helper.
+
+- On the other hand, if there's is *only* the "Source code" link, then
+  it's an automatically generated tarball and you should use the
+  'github' helper function.
diff --git a/docs/website/images/github_hash_mongrel2.png b/docs/website/images/github_hash_mongrel2.png
new file mode 100644
index 0000000..c695c31
Binary files /dev/null and b/docs/website/images/github_hash_mongrel2.png differ
