From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:15:09 +0200
Subject: [Buildroot] [PATCH 03/11] package/mesa3d: rename the prompt
In-Reply-To: <cover.1402236631.git.yann.morin.1998@free.fr>
References: <cover.1402236631.git.yann.morin.1998@free.fr>
Message-ID: <0ae1a550f2f46b1432d2bee725c4e957889f4a59.1402236631.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Rename the prompt for mesa3d so that it matches what we usually do
for prompts of packages: just name the package in lower case.

This will help generate nicer tables in the generated packages list,
both in existing tables, and in the upcoming table of virtual packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.3.2
