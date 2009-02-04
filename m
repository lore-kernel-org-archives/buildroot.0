From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 3 Feb 2009 23:49:10 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
Message-ID: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    I thought it was seattled sometime last year that kernel names
would not include timestamps or any think that breaks u-boot from
loading the kernel.

    I just had atngw100-linux-2.6.27.13-20090203.gz for a kernel name.
It's already bad enough that rootfs has stupid timestamps, we don't
really need kernel binaries too. If I wanted to preserve binaries, I
would copy them over before building again. Whenever I type make, I
expect things to be overwritten.
    As I develop a system, I don't want to find out that I'm out of
disk space because it has every single failed attempt in binaries
folder. I also don't want to touch u-boot in anyway, don't care if
there are autoscripts or not. Ideally it would be named uImage like
the kernel folks intended.

    Peter, could we hear your opinion on this? At least let's make
this optional and never bother with it again.


Kind Regards,
    Thiago A. Correa
