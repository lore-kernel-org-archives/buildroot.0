From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 13:53:20 +0100
Subject: [Buildroot] [git commit] libgcrypt: link to a more informative
	homepage
Message-ID: <20141118125324.ADC3DB4868@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed21bb97346d9e9e6c1a6497bcabeba57c2e71ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgcrypt/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index 55d2f17..dd8f270 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBGCRYPT
 	help
 	  LibGCrypt is GNU's basic cryptographic library.
 
-	  ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
+	  http://www.gnu.org/software/libgcrypt/
