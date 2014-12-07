From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:54:27 +0100
Subject: [Buildroot] [git commit] docs: fix typo in cmake-package
	documentation
Message-ID: <20141207205512.094C07FC13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5be88854d009dbed95097f7965994b7eb6c95955
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cmake-package documentation was referring to
BR2_PREFER_STATIC_LIBS, while the option is actually named
BR2_PREFER_STATIC_LIB. This commit fixes this mistake.

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-cmake.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 02f1dbb..097cf63 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -102,7 +102,7 @@ typical packages will therefore only use a few of them.
 
 ** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
 ** +CMAKE_INSTALL_PREFIX+;
-** +BUILD_SHARED_LIBS+ is driven by +BR2_PREFER_STATIC_LIBS+;
+** +BUILD_SHARED_LIBS+ is driven by +BR2_PREFER_STATIC_LIB+;
 ** +BUILD_DOC+, +BUILD_DOCS+ are disabled;
 ** +BUILD_EXAMPLE+, +BUILD_EXAMPLES+ are disabled;
 ** +BUILD_TEST+, +BUILD_TESTS+, +BUILD_TESTING+ are disabled.
