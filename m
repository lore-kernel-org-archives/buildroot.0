From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 24 Feb 2014 19:18:18 +0100
Subject: [Buildroot] Few questions external toolchain
Message-ID: <530B8CEA.90306@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
after reading the documentation I still have some questions.
I want to use a Linaro toolchain for an imx6 board.

The toolchain is hosted on a git repository, and I don't understand how 
to tell this to buildroot. It seems it looks for a tar.gz file.

Anyway I tried to manually git clone the toolchain and I passed the 
directory of the local repo.
When it tries to compile something it returns:

checking for arm-buildroot-linux-gnueabi-gcc... 
/home/marco/dev/buildroot/output/host/usr/bin/arm-fsl-linux-gnueabi-gcc
checking whether the C compiler works... no
configure: error: in 
`/home/marco/dev/buildroot/output/build/alsa-lib-1.0.26':

the path is correct, but why it looks for 
"arm-buildroot-linux-gnueabi-gcc"? It seems the internal toolchain!

Attached there is my .config file and the buildroot version is: 2014.02-rc2

Thanks!
Marco


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 39446 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140224/b4b6c472/attachment.wsdl>
