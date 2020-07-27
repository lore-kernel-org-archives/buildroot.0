From: Ernie Carp <erniecarp2018@gmail.com>
Date: Mon, 27 Jul 2020 11:39:41 -0700
Subject: [Buildroot] Help with NodeJS
Message-ID: <CAHdaamOs2Tmk6FTCGfodZnhpQ3FvpKm4USCd+XVoWLr2a93q-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Using:
Using Buildroot Version: 2020.08-git-00103-gc7cd1f0-dirty
Board: atmel_sama5d27_som1_ek_mmc_dev_defconfig
uclibc-ng

I am stuck with trying to add NodeJS to my firmware image.

Buildroot says:
nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.9, wchar

c++ is selected
wchar is selected
NPTL is selected
gcc is v8.x

I cannot find dynamic library in menuconfig. I am doing something wrong but
don't know what. For the heck of it, I tried rebuilding everything using
glibc, but I still can't find dynamic library and NodeJS is still not
selectable. I could use a little help.

Thank you,
Ernie Carp
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/24d05dd4/attachment.html>
