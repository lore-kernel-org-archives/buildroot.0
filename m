From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 23:53:14 +0100
Subject: [Buildroot] [git commit] docs/manual/resources.txt: fix patchwork
	link
Message-ID: <20141113225713.2218DB32D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4900b2c63b301445cca5f3674f83c573dfbcc0e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patchwork website needs the trailing slash, otherwise it returns a 404.

Reported-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/resources.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index b11053e..b327f9e 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -60,7 +60,7 @@ project. Patches that have been sent to a mailing list are \'caught' by
 the system, and appear on a web page. Any comments posted that
 reference the patch are appended to the patch page too. For more
 information on Patchwork see
-http://jk.ozlabs.org/projects/patchwork[].
+http://jk.ozlabs.org/projects/patchwork/[].
 +
 Buildroot's Patchwork website is mainly for use by Buildroot's
 maintainer to ensure patches aren't missed. It is also used by Buildroot
