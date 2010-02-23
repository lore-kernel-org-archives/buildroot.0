From: Roo <roo.watt@gmail.com>
Date: Tue, 23 Feb 2010 14:51:37 +1100
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
Message-ID: <815f0bd71002221951v606dbdddn381587fdd662e485@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am new to buildroot and have been given a AT91SAM9260 SOM to work
with. The latest buildroot does not appear to include a defconfig for
a NAND boot system. The module in question is
http://www.otech.cn/chinese/ProductShow.asp?ID=103 and they do not
provide a build system, just a rootfs image and kernel image etc,
unfortunately that is nearly all the information I have on the board.

I would like to use buildroot to build the rootfs, kernel and tools
required for our application. I would appreciate any advice on where
to start with this, is there any reason that a NAND boot defconfig
does not exist currently? Will it be a difficult job to develop one? I
know that there is a rootsf image and kernel image at at91.com but I
see more value in supporting the latest buildroot particularly as I
would like to integrate our own packages.

Also can anyone advise whether there are issues building on a 64bit host?

Any advice appreciated.


Kind regards,

Cameron.
