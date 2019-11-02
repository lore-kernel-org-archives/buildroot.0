From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 19:00:52 +0100
Subject: [Buildroot] [PATCH 3/3] docs/manual: document D language support
In-Reply-To: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
References: <20191102180052.23080-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102180052.23080-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 docs/manual/adding-packages-directory.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index e6201bb86b..1c8b9f96b5 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -322,6 +322,10 @@ use in the comment.
 ** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
 ** Comment string: `C++`
 
+* D support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_DLANG+
+** Comment string: `Dlang`
+
 * Fortran support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_FORTRAN+
 ** Comment string: `fortran`
-- 
2.21.0
