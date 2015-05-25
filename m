From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 22:34:07 +0200
Subject: [Buildroot] [git commit] docs/manual/br2-external: remove
	superfluous leading space in code blocks
Message-ID: <20150525205004.74C417FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=188025e69195476f3fc07cee32e20660ffe0c8c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They are not needed, and other code blocks in the same file are not
indented either.

Remove those leading spaces, so all our code blocks look the same.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-outside-br.txt |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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
