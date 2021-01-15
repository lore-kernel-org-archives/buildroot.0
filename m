From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 15 Jan 2021 12:03:15 -0800
Subject: [Buildroot] [PATCH 0/4] ARC updates
Message-ID: <20210115200319.4139041-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

PFA assorted ARC changes. Main being a hw config for -mcpu=hs4x which
schedules code for HS48x dual issue pipeline.

Thx,
-Vineet

Vineet Gupta (4):
  ARC: Add support for generic HS48 processor
  configs/snps_archs38_hsdk_defconfig: refresh defconfig
  configs/snps_archs38_hsdk_defconfig: switch to glibc hard-float
  configs/snps_archs38_hsdk_defconfig: update for better out-of-box
    experience

 arch/Config.in.arc                  | 16 +++++++++----
 configs/snps_archs38_hsdk_defconfig | 36 +++++++++++++++--------------
 2 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.25.1
