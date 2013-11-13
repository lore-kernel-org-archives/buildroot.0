From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 00:53:33 +0100
Subject: [Buildroot] [PATCH 2/4] support/kconfig: update our README
In-Reply-To: <cover.1384386575.git.yann.morin.1998@free.fr>
References: <cover.1384386575.git.yann.morin.1998@free.fr>
Message-ID: <d513125f634903f2f6e33150a7358922ce2b08ce.1384386575.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The procedure to update our copy of kconfig was mising copying a file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/README.buildroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 0e16e81..6f65715 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -4,7 +4,7 @@ to suit Buildroot.
 To update:
 	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
 	cd support/kconfig.new
-	cp -a ../kconfig/patches ../kconfig/README.buildroot .
+	cp -a ../kconfig/patches ../kconfig/README.buildroot ../kconfig/.gitignore .
 	quilt push -a
 	# Fix any conflict
 	cd ..
-- 
1.8.1.2
