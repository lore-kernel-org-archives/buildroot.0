From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Jan 2012 19:40:32 +0100
Subject: [Buildroot] [git commit] pkg-stats: fix table layout
Message-ID: <20120111184054.BFDBF90302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e6695fc365df202ec8e27c7deb322a34ae3abf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "Patch count" cell needs rowspan=2, otherwise the host/target cells are
misaligned.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 64aae5f..8228274 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -51,7 +51,7 @@ tr.correct td {
 <tr>
 <td rowspan=\"2\">Id</td>
 <td rowspan=\"2\">Package</td>
-<td>Patch count</td>
+<td rowspan=\"2\">Patch count</td>
 <td colspan=\"2\" class=\"centered\">AUTOTARGETS</td>
 <td colspan=\"2\" class=\"centered\">GENTARGETS</td>
 <td colspan=\"2\" class=\"centered\">CMAKETARGETS</td>
