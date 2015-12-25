From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:44 +0100
Subject: [Buildroot] [PATCH 75/84 RFC] package/ntp: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <bab83dfde4ba020f07e7fb8ba333a46d2116431c.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ntp has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ntp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 1763225..2b8ecc9 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NTP
+menuconfig BR2_PACKAGE_NTP
 	bool "ntp"
 	select BR2_PACKAGE_LIBEVENT
 	help
-- 
1.9.1
