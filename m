From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  7 Jun 2017 21:10:26 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with python
Message-ID: <20170607191026.14004-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/graph-depends | 2 +-
 support/scripts/scanpypi      | 2 +-
 support/scripts/xorg-release  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index b258c565..db3041b3 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 
 # Usage (the graphviz package must be installed in your distribution)
 #  ./support/scripts/graph-depends [-p package-name] > test.dot
diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index e174ac69..44e5d205 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -1,4 +1,4 @@
-#!/usr/bin/python2
+#!/usr/bin/env python2
 """
 
 Utility for building Buildroot packages for existing PyPI packages
diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
index 66fc100b..c512038c 100755
--- a/support/scripts/xorg-release
+++ b/support/scripts/xorg-release
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 
 # This script generates a report on the packaging status of X.org
 # releases in Buildroot. It does so by downloading the list of
-- 
2.12.2
