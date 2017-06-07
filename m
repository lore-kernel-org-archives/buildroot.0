From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 21:55:10 +0200
Subject: [Buildroot] [git commit] support/scripts: fix shebang with python
Message-ID: <20170607200904.8B1388010B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed0ce4953773c1d803edef50f567889ce8825f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/graph-depends | 2 +-
 support/scripts/scanpypi      | 2 +-
 support/scripts/xorg-release  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index b258c56..db3041b 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 
 # Usage (the graphviz package must be installed in your distribution)
 #  ./support/scripts/graph-depends [-p package-name] > test.dot
diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index e174ac6..44e5d20 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -1,4 +1,4 @@
-#!/usr/bin/python2
+#!/usr/bin/env python2
 """
 
 Utility for building Buildroot packages for existing PyPI packages
diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
index 66fc100..c512038 100755
--- a/support/scripts/xorg-release
+++ b/support/scripts/xorg-release
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 
 # This script generates a report on the packaging status of X.org
 # releases in Buildroot. It does so by downloading the list of
