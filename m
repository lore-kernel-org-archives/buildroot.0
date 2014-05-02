From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 12:49:28 +0200
Subject: [Buildroot] [PATCH] manual: fix C++ suport in libc case,
	fix indentation
Message-ID: <1399027768-28337-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The manual has this sentence for the dependency on a C library *and* a
toolchain feature:

    foo needs an (e)glibc toolchain, or foo needs an (e)glibc toolchain
    w/ C++ support

And then, just below, the comment text for C++ is just 'C++', not
'C++ support'.

Fix that, and add a bit of indentation too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.3.2
