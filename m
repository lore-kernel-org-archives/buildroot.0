From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 11:33:00 +0100
Subject: [Buildroot] [git commit] docs/manual: slightly clarify patch
	licensing
Message-ID: <20160225105037.406D180065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ab41aed2c30ae7d040551224f579c2d8b3adc3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a patch is a modification to Buildroot. Thus this sentence might be
interpreted as "Patches are released under the Buildroot license".

Being a legal matter, the last thing we want is to be
ambiguous. Reword the sentence to avoid any misunderstandings.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/patch-policy.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 0b4604e..d50c971 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -90,8 +90,8 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
 
 === Format and licensing of the package patches
 
-Patches are released under the same license as the software that is
-modified.
+Patches are released under the same license as the software they apply
+to.
 
 A message explaining what the patch does, and why it is needed, should
 be added in the header commentary of the patch.
