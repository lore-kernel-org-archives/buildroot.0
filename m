From: =?UTF-8?Q?Rafa=C5=82_Fabich?= <rafal.fabich@gmail.com>
Date: Mon, 28 Jan 2013 10:51:11 +0100
Subject: [Buildroot] kernel and u-boot source from local directory
Message-ID: <CAPRxd43J2Cc+xwBAaUKvQSMccRgcHQJmMEGFg8S7+uQtQxpkyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just made changes to the Buildroot (version 2012.11) so that it
enables me to use local directories containing the U-boot anf Linux kernel
source code.
The addition is made to my linux.mk, uboot.mk and corresponding Config.in
files. The boot/uboot/Config.in also contains addition regarding Freescale
i.MX6 version of u-boot image (extension "imx").

I think that these changes might be useful for anyone who works on
development of Linux kernel or U-boot source code and uses Buildroot to
configure the entire target system.

If you agree and find it useful, please let me know if and how can I add
those changes to the Buildroot.


With kind regards,
Rafal Fabich
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130128/54f9c6a1/attachment.html>
