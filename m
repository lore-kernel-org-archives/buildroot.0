From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 16 Oct 2016 13:15:05 -0400
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix scanpypi path typos
Message-ID: <1476638105-2310-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 docs/manual/adding-packages-python.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 94ac809..ec33483 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -178,7 +178,7 @@ your host.
 When at the root of your buildroot directory just do :
 
 -----------------------
-./support/script/scanpypi foo bar -o package
+./support/scripts/scanpypi foo bar -o package
 -----------------------
 
 This will generate packages +python-foo+ and +python-bar+ in the package
@@ -198,7 +198,7 @@ If your Buildroot package is not in the official Buildroot tree but in
 a +BR2_EXTERNAL+ tree, use the -o flag as follows:
 
 -----------------------
-./support/script/scanpypi foo bar -o other_package_dir
+./support/scripts/scanpypi foo bar -o other_package_dir
 -----------------------
 
 This will generate packages +python-foo+ and +python-bar+ in the
@@ -207,7 +207,7 @@ This will generate packages +python-foo+ and +python-bar+ in the
 Option +-h+ will list the available options:
 
 -----------------------
-./support/script/scanpypi -h
+./support/scripts/scanpypi -h
 -----------------------
 
 [[python-package-cffi-backend]]
-- 
1.9.1
