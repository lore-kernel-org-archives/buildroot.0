From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 May 2014 14:58:15 +0200
Subject: [Buildroot] [git commit] manual: fix C++ support in libc case,
	fix indentation
Message-ID: <20140502125931.6964B9C0A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e3cb35737066534a9588c72aac1808305d635f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual has this sentence for the dependency on a C library *and* a
toolchain feature:

    foo needs an (e)glibc toolchain, or foo needs an (e)glibc toolchain
    w/ C++ support

And then, just below, the comment text for C++ is just 'C++', not
'C++ support'.

Fix that, and add a bit of indentation too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5d4d5d9..3cf3afa 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -227,10 +227,10 @@ use in the comment.
 
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
-+BR2_TOOLCHAIN_USES_UCLIBC+
+   +BR2_TOOLCHAIN_USES_UCLIBC+
 ** Comment string: for the C library, a slightly different comment text
    is used: +foo needs an (e)glibc toolchain+, or `foo needs an (e)glibc
-   toolchain w/ C++ support`
+   toolchain w/ C++`
 
 * C++ support
 ** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
