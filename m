From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:04:30 +0100
Subject: [Buildroot] [PATCH 04/13] docs/manual: reference Python and Lua
	infras from the list of package infrastructures
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393167879-16637-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 754a145..eff92fa 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -323,5 +323,16 @@ different way, using different infrastructures:
    CMake. We cover them through a xref:cmake-package-tutorial[tutorial]
    and xref:cmake-package-reference[reference].
 
+* *Makefiles for Python modules*: We have a dedicated infrastructure
+   for Python modules that use either the +distutils+ or the
+   +setuptools+ mechanism. We cover them through a
+   xref:python-package-tutorial[tutorial] and
+   xref:python-package-reference[reference].
+
+* *Makefiles for Lua modules*: We have a dedicated infrastructure for
+   Lua modules available through the LuaRocks web site. We cover them
+   through a xref:luarocks-package-tutorial[tutorial] and
+   xref:luarocks-package-reference[reference].
+
 Further formatting details: see xref:writing-rules-mk[the writing
 rules].
-- 
1.8.3.2
