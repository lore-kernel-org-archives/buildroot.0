From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 22:15:36 +0100
Subject: [Buildroot] [git commit] manual: fix missing DL_DIR rename to
	BR2_DL_DIR
Message-ID: <20140224214311.4E13B9BA1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d1216901fa676512c8f09e506b0db42af643745
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was one instance of DL_DIR that was left out. Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 14971b5..04e589f 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -253,7 +253,7 @@ information is (assuming the package name is +libfoo+) :
   Buildroot should download from +LIBFOO_SITE+ in addition to the main
   +LIBFOO_SOURCE+ (which usually is a tarball). Buildroot will not do
   anything with those additional files, except download files: it will
-  be up to the package recipe to use them from +$(DL_DIR)+.
+  be up to the package recipe to use them from +$(BR2_DL_DIR)+.
 
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
   package source code. In many cases, Buildroot guesses the method
