From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Nov 2017 10:26:23 +0100
Subject: [Buildroot] [git commit branch/next] CHANGES: add toolchain info
 missing from 2017.11-rc1
Message-ID: <20171113221621.8BAE4807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f36962e97106e904b4cdc1ff8059397493b68bcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This was missed from the release update.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGES b/CHANGES
index 632660e..a9f3365 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,11 @@
 	bit bigger than before. To remove unneeded MIBS, you should use a
 	post-build script.
 
+	Toolchain: Linaro toolchains updated to 2017.08, ARC toolchain
+	updated to 2017.09, Glibc updated to 2.26, Glibc support for
+	ARCv2. The toolchain wrapper now handles SOURCE_DATE_EPOCH for
+	older (pre-gcc7.x) toolchains for BR2_REPRODUCIBLE.
+
 	New defconfigs: Atmel SAM45D27, Bananapi M1 and M2 Plus,
 	Engicam i.CoreM6 Qt5 configuration, i.MX6 sabreauto (mainline
 	kernel/u-boot), i.MX6Q sabresd Qt5 configuration, i.MX7d-pico,
