From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 19:42:24 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/intel-microcode:
 security bump to version 20180108
Message-ID: <20180116194020.AAF6E83C30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=669edf51ee9e65aa1082a2e0c0e26ab029717540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Quoting releasenote:

"Intel Processor Microcode Package for Linux
20180108 Release

-- Updates upon 20171117 release --
IVT C0          (06-3e-04:ed) 428->42a
SKL-U/Y D0      (06-4e-03:c0) ba->c2
BDW-U/Y E/F     (06-3d-04:c0) 25->28
HSW-ULT Cx/Dx   (06-45-01:72) 20->21
Crystalwell Cx  (06-46-01:32) 17->18
BDW-H E/G       (06-47-01:22) 17->1b
HSX-EX E0       (06-3f-04:80) 0f->10
SKL-H/S R0      (06-5e-03:36) ba->c2
HSW Cx/Dx       (06-3c-03:32) 22->23
HSX C0          (06-3f-02:6f) 3a->3b
BDX-DE V0/V1    (06-56-02:10) 0f->14
BDX-DE V2       (06-56-03:10) 700000d->7000011
KBL-U/Y H0      (06-8e-09:c0) 62->80
KBL Y0 / CFL D0 (06-8e-0a:c0) 70->80
KBL-H/S B0      (06-9e-09:2a) 5e->80
CFL U0          (06-9e-0a:22) 70->80
CFL B0          (06-9e-0b:02) 72->80
SKX H0          (06-55-04:b7) 2000035->200003c
GLK B0          (06-7a-01:01) 1e->22"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19ab5952fafb6cb3d9ae00efec362fcebac5df99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 4 ++--
 package/intel-microcode/intel-microcode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 0b2aa60..12e1dfb 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 93bd1da9fa58ece0016702e657f708b7e496e56da637a3fe9a6d21f1d6f524dc  microcode-20171117.tgz
-sha256 6f905d812453a4775927b2558d51e5ca25a8e0b9bd06841b1b366c722dc0a64f  license.txt
+sha256 063f1aa3a546cb49323a5e0b516894e4b040007107b8c8ff017aca8a86204130  microcode-20180108.tgz
+sha256 6d4deb65ca688d930e188bf93f78430f134097b161e6df4a2ef00728e14965e3  license.txt
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 7a88138..d6c35b2 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20171117
+INTEL_MICROCODE_VERSION = 20180108
 INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
-INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/27337/eng
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/27431/eng
 INTEL_MICROCODE_STRIP_COMPONENTS = 0
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license.txt
