From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 16:59:06 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/gdb: move patch
 directory
Message-ID: <20181001145905.DA5CA8A696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=345a2d358a82095d23aa86b162ea4e1114a3253c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

commit 9cf4964da56863dfe4ce729c32400bd9acf25ee7 forgot to move patch directory.

Fixes:
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552306

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 521676cfe021497b535e87c98c484ac0790c4db4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch       | 0
 .../0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch       | 0
 package/gdb/{8.1 => 8.1.1}/0003-use-asm-sgidefs.h.patch                   | 0
 package/gdb/{8.1 => 8.1.1}/0004-gdbserver-fix-build-for-m68k.patch        | 0
 .../{8.1 => 8.1.1}/0005-nat-fork-inferior-include-linux-ptrace.h.patch    | 0
 5 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/gdb/8.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.1.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/8.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/8.1.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/8.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.1.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/8.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/8.1.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/8.1/0003-use-asm-sgidefs.h.patch b/package/gdb/8.1.1/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/8.1/0003-use-asm-sgidefs.h.patch
rename to package/gdb/8.1.1/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/8.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.1.1/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/8.1/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/8.1.1/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/8.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.1.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/8.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/8.1.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
