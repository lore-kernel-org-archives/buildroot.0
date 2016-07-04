From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:53 +0200
Subject: [Buildroot] [PATCH 42/83 v2] package/google-material-design-icons:
	use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <85d16551cf53f9833c276fc5bc5336bd36b87a42.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

google-material-design-icons has more than 5 options, so use a
'menuconfig' to group the options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/google-material-design-icons/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/google-material-design-icons/Config.in b/package/google-material-design-icons/Config.in
index a200429..d7be363 100644
--- a/package/google-material-design-icons/Config.in
+++ b/package/google-material-design-icons/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
+menuconfig BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
 	bool "google-material-design-icons"
 	help
 	  Material design icons are the official icon set from Google that
-- 
2.7.4
