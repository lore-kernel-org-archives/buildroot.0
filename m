From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Mon, 18 Jun 2018 14:19:14 +0200
Subject: [Buildroot] [PATCH i-g-t v2 1/1] docs/manual/prerequisite.txt:
Message-ID: <20180618121914.11306-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add required packages to be able to build on Redhat/Debian x86_64 with
prebuilt x86 tools.

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 docs/manual/prerequisite.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 110fab41fd..e47da09382 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -87,3 +87,7 @@ corresponding tool on the host system:
 * Graph generation tools:
 ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
 ** +python-matplotlib+ to use 'graph-build'
+
+* 32-bit compatibility libraries for precompiled executables:
+** +glibc.i686+ and +zlib.i686+ (Redhat/Fedora)
+** +libc6:i386+ and +g++-multilib+ (Debian/Ubuntu)
-- 
2.13.6
