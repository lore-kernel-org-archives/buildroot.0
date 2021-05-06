From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Wed,  5 May 2021 17:39:54 -0700
Subject: [Buildroot] [PATCH 0/3] Buildroot updates for ARC, LMBench
Message-ID: <20210506003957.2994235-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please apply the assorted fixes.

Thx,
-Vineet

Vineet Gupta (3):
  ARC: config: explicit'ify -mcpu for cpu selection
  lmbench: increase memsize delay for slow FPGAs
  lmbench: emulate --prefix to avoid scattering binaries all over

 arch/Config.in.arc                            |  8 +++---
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 package/lmbench/lmbench.mk                    |  9 +++++-
 3 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch

-- 
2.25.1
