From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 4 Feb 2019 15:23:27 +0100
Subject: [Buildroot] [git commit] support/scripts/graph-build-time: replace
 confusing colors
Message-ID: <20190204142224.CAB337FA05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e3c632f7d5392e9f41d3a20bc30edd5f3aadcfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The color for 'extract' is very similar to the one for 'install-images'.
Both are cyan-like.

Replace the former by a pale blue to make all colors sufficiently distinct.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/graph-build-time | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 2fdb6a476d..ba3cdad85b 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -76,7 +76,7 @@ steps = ['download', 'extract', 'patch', 'configure', 'build',
 default_colors = ['#8d02ff', '#e60004', '#009836', '#2e1d86', '#ffed00',
                   '#0068b5', '#f28e00', '#940084', '#97c000']
 
-alternate_colors = ['#ffbe0a', '#00e0e0', '#3f7f7f', '#ff0000', '#00c000',
+alternate_colors = ['#ffbe0a', '#96bdff', '#3f7f7f', '#ff0000', '#00c000',
                     '#0080ff', '#c000ff', '#00eeee', '#e0e000']
 
 
