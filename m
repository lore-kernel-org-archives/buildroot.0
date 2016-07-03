From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] docs/manual: document dependency on fortran
Message-ID: <20160703145820.86DA981E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abfef1ca354bd5c337a7061485e82c0a0fbc8735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index ee4a721..dc66f00 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -318,6 +318,10 @@ use in the comment.
 ** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
 ** Comment string: `C++`
 
+* Fortran support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_FORTRAN+
+** Comment string: `fortran`
+
 * thread support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
 ** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
