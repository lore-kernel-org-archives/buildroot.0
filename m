From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 22:16:49 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: slightly improve faq entry
	about compiler on target
Message-ID: <1412799410-19667-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/faq-troubleshooting.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
2.0.0
