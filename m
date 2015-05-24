From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 May 2015 23:49:55 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual/br2-external: remove
	superfluous leading tabs in code blocks
In-Reply-To: <cover.1432504112.git.yann.morin.1998@free.fr>
References: <cover.1432504112.git.yann.morin.1998@free.fr>
Message-ID: <98faf4cdac7e7b6f7020e6317b074330f222ab7f.1432504112.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They are not needed, and other code blocks in the same file are not
indented either.

Remove those leading spaces, so all our code blocks look the same.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/customize-outside-br.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index aac9a43..99a942c 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -33,27 +33,27 @@ to the Buildroot output directory.
 Some examples:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
+buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
 -----
 
 From now on, external definitions from the +/path/to/foobar+
 directory will be used:
 
 -----
- buildroot/ $ make
- buildroot/ $ make legal-info
+buildroot/ $ make
+buildroot/ $ make legal-info
 -----
 
 We can switch to another external definitions directory at any time:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
+buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
 -----
 
 Or disable the usage of external definitions:
 
 -----
- buildroot/ $ make BR2_EXTERNAL= xconfig
+buildroot/ $ make BR2_EXTERNAL= xconfig
 -----
 
 +BR2_EXTERNAL+ allows three different things:
-- 
1.9.1
