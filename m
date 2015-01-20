From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 17:03:56 +0100
Subject: [Buildroot] [git commit] iperf: add license information
Message-ID: <20150120160418.5E3AC805FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=417302c75b6b1879d838c2eb7596e172baafe049
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iperf/iperf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 2947e52..8496b95 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,6 +6,8 @@
 
 IPERF_VERSION = 2.0.5
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf
+IPERF_LICENSE = MIT-like
+IPERF_LICENSE_FILES = COPYING
 
 IPERF_CONF_ENV = \
 	ac_cv_func_malloc_0_nonnull=yes \
