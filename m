From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  6 Dec 2019 11:39:21 -0800
Subject: [Buildroot] [PATCH 0/3] ARC toolchian related fixes
Message-ID: <20191206193924.18777-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

PFA some improvements agan out of my glibc porting work.

Thx,
-Vineet

Vineet Gupta (3):
  toolchain,glibc: Allow ARC big endian glibc builds
  binutils/ARC: move ARC specific code together
  toolchain/ARC: Enable ability to build with upstream gcc/binutils

 arch/Config.in.arc                      | 4 ++++
 package/binutils/Config.in.host         | 6 +++---
 package/binutils/binutils.mk            | 7 ++-----
 package/gcc/Config.in.host              | 4 ++--
 toolchain/toolchain-buildroot/Config.in | 2 +-
 5 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.20.1
