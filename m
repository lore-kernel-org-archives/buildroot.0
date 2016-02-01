From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:16:08 +0100
Subject: [Buildroot] [git commit] README: add reference to submitting-patches
Message-ID: <20160201224705.274DE7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b084eb38be08c91ca208d79ab03766a309258561
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the hope of improving the quality of patches sent by newcomers,
add a reference to the submitting-patches section of the manual
to the top-level README file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index e863f0e..c617252 100644
--- a/README
+++ b/README
@@ -21,3 +21,6 @@ Buildroot comes with a basic configuration for a number of boards. Run
 Please feed suggestions, bug reports, insults, and bribes back to the
 buildroot mailing list: buildroot at buildroot.org
 You can also find us on #buildroot on Freenode IRC.
+
+If you would like to contribute patches, please read
+https://buildroot.org/manual.html#submitting-patches
