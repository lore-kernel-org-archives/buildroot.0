From: Enoch W. <ixew@hotmail.com>
Date: Fri, 21 Sep 2018 19:20:15 +0000
Subject: [Buildroot] ti-sgx-km
Message-ID: <CO2PR01MB19766F7AADB1651F9E58E8BDCC120@CO2PR01MB1976.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This package is the kernel module of TI AM3358 graphic accelerator, the SoC that powers the popular Beaglebone Black board.
Unfortunately, it fails to compile on buildroot with some complex header issues... I am using beagleboard/linux github (4.14-rt branch).
Perhaps it is because this package is based on TI's  old SDK version 2 while the current one is SDK version 5.
TI's own Linux SDK (*) is based on YOCTO which makes it a no trivial task to copy to buildroot.
Without a graphic accelerator means to be without opengl/ex, and that is a serious deficiency.
Help would be appreciated to overcome this hurdle, I really wish to stay with buildroot.

Thanks in advance, Enoch.

(*) ti-processor-sdk-linux-rt-am335x-evm-05.00.00.15


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180921/c89783b0/attachment.html>
