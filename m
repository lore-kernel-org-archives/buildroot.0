From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Nov 2012 08:43:43 +0100
Subject: [Buildroot] [git commit] manual: prerequisite.txt: add texinfo to
	the mandatory package list
Message-ID: <20121116074438.0C3AA9A043@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7ece205fae5070b2ddaddf60ee73357ce4ad2bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the internal Buildroot toolchain backend, makeinfo, whom belongs to
the texinfo package, is required to build gcc and gdb.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/prerequisite.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 693347b..31d437d 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -42,6 +42,7 @@ Mandatory packages
 ** +python+ (version 2.6 or 2.7)
 ** +unzip+
 ** +rsync+
+** +texinfo+ (required for internal Buildroot toolchain backend)
 
 * Source fetching tools:
 ** +wget+
