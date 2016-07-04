From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:54 +0200
Subject: [Buildroot] [PATCH 43/83 v2] package/gr-osmosdr: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <b91ab6b1d21af69a867a339abad4a183e21117f6.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gr-osmosdr has 5-or-more options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gr-osmosdr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index aa6ef0d..56d7fe7 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GR_OSMOSDR
+menuconfig BR2_PACKAGE_GR_OSMOSDR
 	bool "gr-osmosdr"
 	depends on BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_BLOCKS
-- 
2.7.4
