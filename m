From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:39 +0100
Subject: [Buildroot] [PATCH 70/84 RFC] package/ipsec-tools: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <42fcdb41e92a4fc1efe28f2c814a4abc97416bbe.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ipsec-tools has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ipsec-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 4af4095..7309e8d 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_IPSEC_TOOLS
+menuconfig BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_FLEX
-- 
1.9.1
