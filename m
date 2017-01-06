From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 12:18:30 +0100
Subject: [Buildroot] [git commit] docs: Add bc to required tools
Message-ID: <20170106112236.F2432818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc67850dfa6da47bad3627b7f6cf62c0eabff783
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We check for bc under required packages.  It should be listed as such in the
docs.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index ac0ab62..110fab4 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -36,6 +36,7 @@ between distributions).
 ** +unzip+
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
+** +bc+
 
 * Source fetching tools:
 ** +wget+
