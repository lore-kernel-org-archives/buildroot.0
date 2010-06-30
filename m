From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 30 Jun 2010 14:04:06 -0300
Subject: [Buildroot] Kernel build process
In-Reply-To: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
References: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
Message-ID: <AANLkTilDGZs971taBMCY_uFI-DfptLgbrDdkK9AVFLIe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    Also, there is one thing I'm missing: Copy kernel to root filesystem.

    In my target, uboot loads the kernel from /boot. The changes to
the kernel build removed that option. Could we have it back? or should
I run a script after the build to copy it and do any other misc
adjustments?

Kind Regards,
    Thiago A. Correa
