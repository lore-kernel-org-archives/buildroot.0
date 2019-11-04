From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 23:04:36 +0100
Subject: [Buildroot] [git commit] docs/manual: document D language support
Message-ID: <20191104215745.8AB5882CFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dda8eb037b83c7860a95bac74c52e1748e1fe84d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
