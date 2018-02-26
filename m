From: Nimai Mahajan <nimaim@gmail.com>
Date: Mon, 26 Feb 2018 12:17:15 +0000
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <87sh9orlqv.fsf@dell.be.48ers.dk>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be> <20180225172619.GA2276@scaer>
 <CALoSW672Hh1KbdDRWE72JjZn4ajqM1zdFuNakGEJ3G0XM=g6hQ@mail.gmail.com>
 <20180225175247.GB2276@scaer>
 <CALoSW678nNChNVY1pJfq7BKxW4f1YfGXXdcgRW8xsYQDSO0XvA@mail.gmail.com>
 <20180225182810.GC2276@scaer> <87woz0rwi2.fsf@dell.be.48ers.dk>
 <CALoSW65ULMaHGSw6_rF0WptF_uw-hEAo-LHwO9dcj2T5t8L6ZQ@mail.gmail.com>
 <87sh9orlqv.fsf@dell.be.48ers.dk>
Message-ID: <CALoSW65=FRNLPyPW0iKg6qo6QCB+-kZQi-paaErr=82DBuKjng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 26, 2018, 7:14 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Nimai" == Nimai Mahajan <nimaim@gmail.com> writes:
>
> Hi,
>
>
>  >> Correct, so this IMHO means we need to move to 5.9 for the LTS version
>  >> by the time we release Buildroot 2019.02, unless something changes -
> But
>  >> until then I would prefer to keep 5.6.
>
>  > Sounds good. People that require this version in the future can simply
>  > patch/port this package. At the very least, we should track the latest
>  > 5.9.x for BR 2018.02 LTS then (as it seems that release will include
> 5.6.x
>  > and 5.9.x). I believe that is currently 5.9.4, with 5.9.5 coming in
> March.
>  > Their patch version updates contain hundreds of bug fixes. Thanks.
>
> Indeed. Care to send a patch bumping the 5.9 version to 5.9.4 for master?
>

I can take a look, though I can only really test on x86 due to lack of
resources/time. Ill have to see what patches were upstreamed first. Stay
tuned.

>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180226/7b237c61/attachment.html>
