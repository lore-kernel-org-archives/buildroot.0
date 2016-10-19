From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:39:42 +0200
Subject: [Buildroot] [git commit] docs/manual: fix scanpypi path typos
Message-ID: <20161019213949.05C1180AC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=556e9f327893eab613f13952a0adc861513889e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index abcd4ca..19d31e2 100644
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
 a br2-external tree, use the -o flag as follows:
 
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
