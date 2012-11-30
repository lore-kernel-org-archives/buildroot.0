From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 12:21:09 -0800
Subject: [Buildroot] [git commit] List the useful hook points available in
	buildroot
Message-ID: <20121130202229.78E429938C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0435a0913cc43f4dff12a081c5b1416d4a7f7730
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The complete list can be obtained with the following command:
  grep "_HOOKS[ ]\+?=" package/pkg-generic.mk

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 3f21f86..6c1c35e 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -358,6 +358,9 @@ useful for generic packages.
 
 The following hook points are available:
 
+* +LIBFOO_POST_DOWNLOAD_HOOKS+
+* +LIBFOO_POST_EXTRACT_HOOKS+
+* +LIBFOO_PRE_PATCH_HOOKS+
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
 * +LIBFOO_POST_CONFIGURE_HOOKS+
