From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 14:00:08 +0200
Subject: [Buildroot] [git commit] package/openfpgaloader: drop udev from
 comment
Message-ID: <20200824115428.09CF483786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15ec88c38749330a747336ec91ad1c0d76f9a8bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5714f3f81fdd85640d627f9b43490c52419650ea forgot to remove udev
from comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openfpgaloader/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 4324507727..cda20b4347 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
-comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++"
+comment "openfpgaloader needs a toolchain w/ threads, wchar, C++"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
+		!BR2_INSTALL_LIBSTDCPP
