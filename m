From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:43:22 +0200
Subject: [Buildroot] [git commit] graph-depends: document the 'transitive'
	variable
Message-ID: <20140608145131.9175C9CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a2db6d19322b46968e63df06b562ec0cbaa2d0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although unnecessary (we already have initialisation via the parser),
initialise the 'transitive' option, and document it at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 0dafd77..07b9c22 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -37,6 +37,9 @@ mode = 0
 # Limit drawing the dependency graph to this depth. 0 means 'no limit'.
 max_depth = 0
 
+# Whether to draw the transitive dependencies
+transitive = True
+
 parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
