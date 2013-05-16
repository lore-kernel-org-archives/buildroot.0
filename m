From: Carlo Caione <carlo.caione@gmail.com>
Date: Thu, 16 May 2013 07:34:25 +0200
Subject: [Buildroot] [PATCH 0/2] cubieboard: new set of patches for mainline
	kernel
Message-ID: <1368682467-12228-1-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
the following two patches are again for cubieboard but using the mainline
kernel and limiting as much as possible the usage of tools from
sunxi-repository.

Carlo Caione (2):
  cubieboard: defconfig for mainline kernel
  cubieboard: board specific files and script

 board/cubietech/cubieboard_mainline/mksdcard.sh   | 73 +++++++++++++++++++++
 board/cubietech/cubieboard_mainline/readme.txt    | 77 +++++++++++++++++++++++
 board/cubietech/cubieboard_mainline/uEnv-tftp.txt |  4 ++
 board/cubietech/cubieboard_mainline/uEnv.txt      |  1 +
 configs/cubieboard_mainline_defconfig             | 27 ++++++++
 5 files changed, 182 insertions(+)
 create mode 100755 board/cubietech/cubieboard_mainline/mksdcard.sh
 create mode 100644 board/cubietech/cubieboard_mainline/readme.txt
 create mode 100644 board/cubietech/cubieboard_mainline/uEnv-tftp.txt
 create mode 100644 board/cubietech/cubieboard_mainline/uEnv.txt
 create mode 100644 configs/cubieboard_mainline_defconfig

-- 
1.8.2.3
