From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 15:58:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] docs/manual: fix
 graph-size documentation
Message-ID: <20190902135428.5A9CD8915E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d4ab0761f475c70be979494d5371f9e3186eb8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22b7f96752981f20d94fb620e2a370b38a2fe68e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index e3d7578c85..a36301afd5 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -310,8 +310,8 @@ installed (+python-matplotlib+ on most distributions), and also the
 +argparse+ module if you're using a Python version older than 2.7
 (+python-argparse+ on most distributions).
 
-Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
-supported to adjust the output file format. See xref:graph-depends[]
+Just like for the duration graph, a +BR2_GRAPH_OUT+ environment variable
+is supported to adjust the output file format. See xref:graph-depends[]
 for details about this environment variable.
 
 .Note
