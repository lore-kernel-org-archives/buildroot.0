From: Davide Viti <zinosat@tiscali.it>
Date: Sun, 25 Nov 2012 17:43:37 +0100
Subject: [Buildroot] [PATCH] List the useful hook points available in
	buildroot
Message-ID: <1353861817-4570-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The complete list can be obtained with the following command:
  grep "_HOOKS[ ]\+?=" package/pkg-generic.mk

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 docs/manual/adding-packages-generic.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b05043a..3057074 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -357,6 +357,9 @@ userful for generic packages.
 
 The following hook points are available:
 
+* +LIBFOO_POST_DOWNLOAD_HOOKS+
+* +LIBFOO_POST_EXTRACT_HOOKS+
+* +LIBFOO_PRE_PATCH_HOOKS+
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
 * +LIBFOO_POST_CONFIGURE_HOOKS+
-- 
1.7.2.5
