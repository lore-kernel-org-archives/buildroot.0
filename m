From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Nov 2012 09:17:24 +0100
Subject: [Buildroot] [git commit] pkg-stats: fix the broken "results" link
Message-ID: <20121106072422.6378299BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f54752b67306a0b2648379db2102b1ea297ba448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the top of the output html page there is a dangling "results" link.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9c8ec49..929b8d1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -227,6 +227,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 done
 echo "</table>"
 
+echo "<a id="results"></a>"
 echo "<table>"
 echo "<tr>"
 echo "<td>Packages using the <i>generic</i> infrastructure</td>"
