From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 12:02:49 +0200
Subject: [Buildroot] [git commit] package/qt5quicktimeline: fix hash
Message-ID: <20200614100305.1384182232@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e9345e193b6d4fd1c72dbec8ba82f3eb8382e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e47ec96e80635d0b459a748a4ec3fd4eb6f24032 forgot to update
hash of qt5quicktimeline

Fixes:
 - http://autobuild.buildroot.org/results/203008f23aebe60ea59bd1e316e4d78f93da76f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index a81bec0d66..8a013ce9d6 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtquicktimeline-everywhere-src-5.14.2.tar.xz.sha256
-sha256  83a45d0998cbc77f8094854a477ab1ac0838ae7fd822563d995df40149893a9e  qtquicktimeline-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtquicktimeline-everywhere-src-5.15.0.tar.xz.sha256
+sha256  16ffeb733ba15815121fca5705ed5220ce0a0eb2ec0431ad0d55da9426a03c00  qtquicktimeline-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
