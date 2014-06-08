From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:07:41 +0200
Subject: [Buildroot] [git commit] package/mesa3d: rename the prompt
Message-ID: <20140608151243.B6AB19CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2f3e43afb1857bbd245b35414d73716fc510644
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename the prompt for mesa3d so that it matches what we usually do
for prompts of packages: just name the package in lower case.

This will help generate nicer tables in the generated packages list,
both in existing tables, and in the upcoming table of virtual packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 06f2bc3..6621154 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -1,5 +1,5 @@
 menuconfig BR2_PACKAGE_MESA3D
-	bool "Mesa 3D Graphics Library"
+	bool "mesa3d"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
