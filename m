From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 22:19:31 +0100
Subject: [Buildroot] [git commit] qt5quickcontrols: fix hash file entry
Message-ID: <20181208211611.6E3128B3AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2361ab5180d42e5613110a3e85322203d5a98417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix accidental hash entry change previous commit ('qt5: bump latest version
to 5.11.3' 85ecae213ae5d37c9ddb7390706c18b93035f63b).

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index c4f8fa81dd..25c41c6e34 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,4 +1,4 @@
-ed:   package/qt5/qt5script/qt5script.hash# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtquickcontrols-everywhere-src-5.11.3.tar.xz.sha256
