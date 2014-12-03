From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Dec 2014 22:41:28 +0100
Subject: [Buildroot] [PATCH 1/8] docs: fix typo in cmake-package
	documentation
In-Reply-To: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417642895-29606-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cmake-package documentation was referring to
BR2_PREFER_STATIC_LIBS, while the option is actually named
BR2_PREFER_STATIC_LIB. This commit fixes this mistake.

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-cmake.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.0
