From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Dec 2015 09:14:56 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS
 NiosII toolchain
In-Reply-To: <20151224083849.381556a9@free-electrons.com>
References: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
 <20151224083849.381556a9@free-electrons.com>
Message-ID: <CANLo3JgDh9HBs82x_QoK-ZDTuhP=XTkYKvSMfj34tXRnaQgVyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Le 24 d?c. 2015 08:39, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> a ?crit :
>
> Dear Romain Naour,
>
> On Thu, 24 Dec 2015 00:03:37 +0100, Romain Naour wrote:
> > The libQtGui.so build triggers an ld error with Binutils 2.25.1
> >
> > Avoid (GCC 5.2 and Binutils 2.25.51):
> >
http://autobuild.buildroot.net/results/c94/c945bce96966e5e39d093c4265058a66f749eea6
> >
> > Similar (GCC 4.9.3 and Binutils 2.25.1):
> >
http://autobuild.buildroot.net/results/ca9/ca981c419bfedb38c591f6e75151a943bc9535ef
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>
> Can you check if the internal NIOSII toolchain also has this problem or
> not?

Actualy, the second build failure was with the internal NIOSII toolchain.

This patch doesn't avoid to select Qt GUI with the internal NIOSII
toolchain :-/

Best regards,
Romain

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151224/5d7cf4d5/attachment.html>
