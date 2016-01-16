From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:43 +0100
Subject: [Buildroot] [PATCH 51/80 v1] package/ipsec-tools: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <94e0fb9e3514b559647c370502fe9f583db9c87c.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ipsec-tools has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
