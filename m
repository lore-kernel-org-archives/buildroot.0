From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Aug 2014 21:41:46 +0200
Subject: [Buildroot] [PATCH 1 of 3 for 2014.08] manual/getting started:
 minor improvements to 'Using Buildroot' section
In-Reply-To: <patchbomb.1408477305@localhost>
References: <patchbomb.1408477305@localhost>
Message-ID: <6da37bceeeff97fcb176.1408477306@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch renames the section 'Using Buildroot' into 'Buildroot quick
start' as real details about Buildroot usage will be in the User Guide
rather than in 'Getting Started'.

Additionally, add a cross-reference to the section about configuring
Buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/using.txt |  5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff -r 44128f28ff7d -r 6da37bceeeff docs/manual/using.txt
--- a/docs/manual/using.txt	Mon Aug 18 00:35:58 2014 +0200
+++ b/docs/manual/using.txt	Tue Aug 12 22:14:07 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Using Buildroot
+== Buildroot quick start
 
 *Important*: you can and should *build everything as a normal user*. There
 is no need to be root to configure and use Buildroot. By running all
@@ -47,7 +47,8 @@
 to get the dependencies of your favorite interface.
 
 For each menu entry in the configuration tool, you can find associated
-help that describes the purpose of the entry.
+help that describes the purpose of the entry. Refer to xref:configure[]
+for details on some specific configuration aspects.
 
 Once everything is configured, the configuration tool generates a
 +.config+ file that contains the entire configuration. This file will be
