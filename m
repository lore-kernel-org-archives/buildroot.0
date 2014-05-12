From: imrehg at gmail.com <imrehg@gmail.com>
Date: Mon, 12 May 2014 13:50:06 +0800
Subject: [Buildroot] [PATCH 0/1] Adding support for the VIA Springboard
Message-ID: <1399873807-9355-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

Hi,

I'm working at VIA Technologies mostly on the Springboard platform,
which is a Cortex-A9 ARM board.

Currently the board has some Linux support through the BSP prepared by
the engineers. I'm hoping to extend that. Thought it would be good to have
buildroot to boot, on principle, and to help further development.

Attached the initial version of the relevant defconfig and the readme with all
required steps. Currently I'm using the original kernel from the BSP, but did
successfully recompile other times to enable new settings. In the future I hope
we can enable kernel and u-boot compile within buildroot as well. At the moment
just want to release whatever work we have done so far for feedback.

Any comments are appreciated!

Cheers,
  Greg


Gergely Imreh (1):
  Adding support for the VIA VAB-600 Springboard

 board/via/springboard/readme.txt  | 82 +++++++++++++++++++++++++++++++++++++++
 configs/via_springboard_defconfig | 12 ++++++
 2 files changed, 94 insertions(+)
 create mode 100644 board/via/springboard/readme.txt
 create mode 100644 configs/via_springboard_defconfig

-- 
1.9.2
