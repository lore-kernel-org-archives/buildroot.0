From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 17:27:02 +0200
Subject: [Buildroot] [git commit] docs/manual: slightly improve faq entry
	about compiler on target
Message-ID: <20141012152913.D6780B2628@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c1b01a17da478a4db799a04d50375ab1ddd5e0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/faq-troubleshooting.txt |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 7195234..693028c 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -35,7 +35,9 @@ target_ would be stopped from the Buildroot-2012.11 release because:
 * this feature was only available for Buildroot toolchains;
 * Buildroot mostly targets _small_ or _very small_ target hardware
   with limited resource onboard (CPU, ram, mass-storage), for which
-  compiling does not make much sense.
+  compiling on the target does not make much sense;
+* Buildroot aims at easing the cross-compilation, making native
+  compilation on the target unnecessary.
 
 If you need a compiler on your target anyway, then Buildroot is not
 suitable for your purpose. In such case, you need a _real
