From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:10:42 +0200
Subject: [Buildroot] [git commit] docs/manual: update external toolchain
	advantages list
Message-ID: <20170620201444.8771881E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e251bdbe8d3efac1c6397d8896d415b5e59e394b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot can build non-uClibc toolchains internally for quite some time now.
Update the manual text.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 0739bc7..945f5b1 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -221,8 +221,6 @@ Advantages of this backend:
   often very significant in the overall build time of an embedded
   Linux system.
 
-* Not limited to uClibc: glibc and eglibc toolchains are supported.
-
 Drawbacks of this backend:
 
 * If your pre-built external toolchain has a bug, may be hard to get a
