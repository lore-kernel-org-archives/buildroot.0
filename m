From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 21:27:07 +0100
Subject: [Buildroot] [git commit] docs/manual: toolchain packages no longer
	use custom makefiles
Message-ID: <20140223213138.CB6FC9B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b100de2cf36d81910ab53978b8a379214a683ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/rebuilding-packages.txt |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 88d6670..da8d230 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -69,8 +69,5 @@ files that just tell whether this or that action has been done):
   Buildroot will trigger the recompilation of the package from the
   compilation step (execution of +make+).
 
-Note: toolchain packages use custom makefiles. Their stamp files are named
-differently.
-
 Further details about package special make targets are explained in
 xref:pkg-build-steps[].
