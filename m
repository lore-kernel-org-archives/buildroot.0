From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Dec 2015 09:36:57 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS
 NiosII toolchain
In-Reply-To: <20151224091911.5380637c@free-electrons.com>
References: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
 <20151224083849.381556a9@free-electrons.com>
 <CANLo3JgDh9HBs82x_QoK-ZDTuhP=XTkYKvSMfj34tXRnaQgVyQ@mail.gmail.com>
 <20151224091911.5380637c@free-electrons.com>
Message-ID: <CANLo3Jih8-QwatDhqeqYcy1G2_2ank2am2LbKWmERpVS1DNtqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 24 d?c. 2015 09:19, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> a ?crit :
>
> Romain,
>
> On Thu, 24 Dec 2015 09:14:56 +0100, Romain Naour wrote:
>
> > > Can you check if the internal NIOSII toolchain also has this problem
or
> > > not?
> >
> > Actualy, the second build failure was with the internal NIOSII
toolchain.
>
> Then it would be good to report the bug to upstream binutils. And
> indeed, your patch needs to be adjusted then :)

I think this patch is ok as is because we black list Qt GUI only with the
CS toolchain and there is nothing we can do to fix the issue.
I will see latter if I found a Binutils patch for it, if not report the
issue.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151224/b355fd4b/attachment.html>
