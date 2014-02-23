From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 21:54:09 +0100
Subject: [Buildroot] [git commit] docs/manual: reference Python and Lua
	infras from the list of package infrastructures
Message-ID: <20140223213139.0A56396E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f886ee34a147de207d09f4ddb7b17f6f4ccee96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust wording as suggested by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 754a145..40e543c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -323,5 +323,16 @@ different way, using different infrastructures:
    CMake. We cover them through a xref:cmake-package-tutorial[tutorial]
    and xref:cmake-package-reference[reference].
 
+* *Makefiles for Python modules*: We have a dedicated infrastructure
+   for Python modules that use either the +distutils+ or the
+   +setuptools+ mechanism. We cover them through a
+   xref:python-package-tutorial[tutorial] and a
+   xref:python-package-reference[reference].
+
+* *Makefiles for Lua modules*: We have a dedicated infrastructure for
+   Lua modules available through the LuaRocks web site. We cover them
+   through a xref:luarocks-package-tutorial[tutorial] and a
+   xref:luarocks-package-reference[reference].
+
 Further formatting details: see xref:writing-rules-mk[the writing
 rules].
