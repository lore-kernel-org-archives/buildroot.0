From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:35:37 +0200
Subject: [Buildroot] [git commit] utils/readme.txt: fix typos for
	size-stats-compare
Message-ID: <20170701223328.46C3E81D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ff0b344af6679518694bd88db09fa2078ae4ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few typos sneaked into the new utils readme...

Additionally, I formulated the list of use cases a bit differently.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index a90805f..fd20e8e 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -28,10 +28,10 @@ scanpypi
     a script to create a Buildroot package by scanning a PyPI package
     description.
 
-size-stat-compare
-    a script to compare the rootfs size between two differnt Buildroot
+size-stats-compare
+    a script to compare the rootfs size between two different Buildroot
     configurations. This can be used to identify the size impact of
-    a specific option, or of a set of specific options, or an update
+    a specific option, of a set of specific options, or of an update
     to a newer Buildroot version...
 
 test-pkg
