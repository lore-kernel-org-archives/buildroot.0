From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:55 -0000
Subject: [Buildroot] [git commit branch/next] opencv: get rid of unused
	SSE41 and SSE42 options
Message-ID: <20120802195250.D43018F944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d19377d24b2b1d6ded278559c16252ec320bef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/opencv.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 10ed5bd..8ae2fd5 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -62,8 +62,6 @@ OPENCV_CONF_OPT += \
 	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
 	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
 	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
-	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE41),ON,OFF) \
-	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
 # Software/3rd-party support options.
