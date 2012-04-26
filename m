From: chinna obireddy <chinnaobi@gmail.com>
Date: Thu, 26 Apr 2012 16:58:09 +0800
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
	BR2_INSTALL_LIBSTDCPP
Message-ID: <CAAawjsQAg_90wznyQw57NbhERqGDizc89Vx2y6rmRb+9B-hAFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have already built the tool chain for mips with gcc 4.3.3 and have been
using from some time. Now we got a request to build an application which
needs g++ compiler for same build.

I have enabled BR2_INSTALL_LIBSTDCPP option in .config file and tried to
build the toolchain I have received the following error:

*cp: cannot stat
`/Reddy/11n_Build/Test/dev_main/build/gcc-4.3.3/build_mips/staging_dir/usr/mips-linux-uclibc/lib*/libstdc++.so*':
No such file or directory*
*
*
I have seen posts on this issue online but couldn't find any solution.
*
*
Thank you in advance,
Reddy.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120426/b771f86a/attachment.html>
