From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:48 +0200
Subject: [Buildroot] [PATCH 37/83 v2] package/efl: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <551bf647ed43c2c76abecca723cf77b1229e085b.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EFL has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4ab1ec4..f6b7fb9 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_EFL
+menuconfig BR2_PACKAGE_EFL
 	bool "efl"
 	 # g++ issue with 4.4.5, tested with g++ 4.7.2
 	depends on BR2_HOST_GCC_AT_LEAST_4_7
-- 
2.7.4
