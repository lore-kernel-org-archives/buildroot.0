From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:39:32 +0200
Subject: [Buildroot] [git commit] manual/getting started: minor improvements
	to 'Using Buildroot' section
Message-ID: <20140821134002.9EFF29D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3afdf89f690e95bc32d75c5f4efbc4142671ac70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch renames the section 'Using Buildroot' into 'Buildroot quick
start' as real details about Buildroot usage will be in the User Guide
rather than in 'Getting Started'.

Additionally, add a cross-reference to the section about configuring
Buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/using.txt |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index ed155c9..975fffc 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Using Buildroot
+== Buildroot quick start
 
 *Important*: you can and should *build everything as a normal user*. There
 is no need to be root to configure and use Buildroot. By running all
@@ -47,7 +47,8 @@ specifically the xref:requirement-optional[optional requirements]
 to get the dependencies of your favorite interface.
 
 For each menu entry in the configuration tool, you can find associated
-help that describes the purpose of the entry.
+help that describes the purpose of the entry. Refer to xref:configure[]
+for details on some specific configuration aspects.
 
 Once everything is configured, the configuration tool generates a
 +.config+ file that contains the entire configuration. This file will be
