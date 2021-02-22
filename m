From: Guy Ka <guyarkam@gmail.com>
Date: Mon, 22 Feb 2021 13:07:43 -0500
Subject: [Buildroot] /bin/ld: skipping incompatible //lib/libpam.so when
 searching for -lpam
Message-ID: <CAEYXRPmmUFFCzSudFX3qqKTRq4=QSBe-eijKvB92HTXJYaNfZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
On a first system (64-bit Centos7), I configured and successfully built
Buildroot (released December 27th, 2020) for RISCV and then did
make source
I then moved the entire directory to another system (64-bit CentOs7)
without internet access. I then did
make clean
and
make
However, while building uuidgen of host-util-linux-2.36, I get the
following error:

/bin/ld: skipping  incompatible //lib/libpam.so when searching for -lpam

I guess there is an issue with the way pam on my second system is
configured but I have no clue where to start digging. I have no root
privilege on this second system.
Thanks for any clue.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210222/2e41fcf5/attachment.html>
