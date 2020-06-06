From: Ernie Carp <erniecarp2018@gmail.com>
Date: Sat, 6 Jun 2020 09:52:07 -0700
Subject: [Buildroot] Build Fail: FONTCONFIG_VERSION = 2.13.1 - Can't find
 uuid
Message-ID: <CAHdaamNmZ_-RT9C0=dOHe_vPUQ_VS=7Hf0gzmLyP4udxajmokQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I post this in case it helps someone else.

Using Buildroot Version: 2020.08-git-00103-gc7cd1f0-dirty
Board: atmel_sama5d27_som1_ek_mmc_dev_defconfig
util-linux version - 2.35.1

When enabling rrdtool, FONTCONFIG_VERSION = 2.13.1 fails with error:

checking for UUID... no
checking where uuid functions comes from... configure: error:
*** uuid is required. install util-linux

I checked, util-linux is installed and uuid is selected but build fails. I
don't know how to fix it properly so I used the older package makefile from
buildroot 2019.05-git-00237-gb643a75-dirty that has util-linux version 2.33
and now rrdtool and all dependencies build without error.

Regards,
Ernie Carp
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200606/2ee1d9aa/attachment.html>
