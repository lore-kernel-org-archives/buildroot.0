From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 23 Jun 2010 12:44:51 -0300
Subject: [Buildroot] [PATCH] Fix u-boot 2010.03 build for AVR32
Message-ID: <AANLkTinrP9FwGkXeMMHMhI4Z2Y6bmS3kv9EOJm6nBtPH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    The following patch fixes the "error: asm/unaligned.h: No such
file or directory" while building u-boot for avr32.

     It's also available for pull from:
git://github.com/correa/Buildroot.git u-boot-avr32-fixes

Thanks,
    Thiago A. Correa
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-u-boot-2010.03-build-for-AVR32-targets.patch
Type: application/octet-stream
Size: 1785 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100623/bdb3975e/attachment.obj>
