From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Mon, 18 Jun 2018 14:48:16 +0200
Subject: [Buildroot] [PATCH i-g-t v3 1/1] docs/manual/prerequisite.txt:
Message-ID: <20180618124816.4258-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add required packages to be able to build on Redhat/Debian x86_64 with
prebuilt x86 tools.

v3:
- Add quotes between `g++-multilib` as noticed by Baruch Siach <baruch@tkos.co.il>

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 docs/manual/prerequisite.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 110fab41fd..0a2d5b6b70 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -87,3 +87,7 @@ corresponding tool on the host system:
 * Graph generation tools:
 ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
 ** +python-matplotlib+ to use 'graph-build'
+
+* 32-bit compatibility libraries for precompiled executables:
+** +glibc.i686+ and +zlib.i686+ (Redhat/Fedora)
+** +libc6:i386+ and `g++-multilib` (Debian/Ubuntu)
-- 
2.13.6
