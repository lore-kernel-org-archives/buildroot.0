From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 20:27:52 +0100
Subject: [Buildroot] [PATCH 00/15] Improvements to x86 bootloaders,
 and x86 boards support
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWaN3kOXtUpfOZiToc2EtNpvTWxfA8yCoZk3BR_drFRBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 11, 2013 at 5:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This commit brings a number of improvements into the world of x86
> bootloaders, and adds support for two x86 boards.
>
> In details:
>
>  * It improves the existing 'grub' package by making sure that we can
>    build a 32 bits Grub even if the selected target architecture is
>    x86-64. This is done by using the host compiler. It also makes
>    various other improvements to the 'grub', and especially adds a
>    HOWTO in the Config.in help text to explain how to install Grub
>    into a disk image, and test it under Qemu.


In [1] I reported that the grub images were excessively large. Is this
still the case?
See also Arnout's reply on that mail...

[1] http://lists.busybox.net/pipermail/buildroot/2013-October/080344.html


Best regards,
Thomas
