From: Juan A. Rubio <jarubio2001@gmail.com>
Date: Fri, 11 Jan 2019 11:39:30 +0000
Subject: [Buildroot] imx6 solo VPU support in Buildroot
Message-ID: <CAE58QoON4RUMgNdtUjBQDpYrmUSqTzjTyxJ+3LGPa=V=Q8kTRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've noticed that the imx6 solo VPU is not supported in Buildroot
starting from 2018.02.x

There is some information about this in this commit:
https://github.com/buildroot/buildroot/commit/b86b227fda97ef439a3cc0da03da0ebcad5c203a

Has anyone come up with a solution to successfully enable the VPU
libraries on imx6 solo with Buildroot?. Is there any more information
about this that might help to get this to work somehow?

(my use case: hw-accelerated mpeg2 video decoding, through qt-multimedia)

Thanks!

P.S.: I was asking this question on #buildroot earlier today and
'kos_tom' mentioned that this Yocto commit may contiain some clues
about what is going on:
https://lists.yoctoproject.org/pipermail/meta-freescale/2017-September/021137.html
