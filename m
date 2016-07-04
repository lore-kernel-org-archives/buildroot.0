From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:12 +0200
Subject: [Buildroot] [PATCH 61/83 v2] package/ntp: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <a2f1a0fc4b6c3a47d306c9616d6d0fa2e0dc07af.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ntp has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.7.4
