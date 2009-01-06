From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 19:55:09 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <877i58nv1k.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<877i58nv1k.fsf@macbook.be.48ers.dk>
Message-ID: <1231268109.32308.216.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 19:33 +0100 skrev Peter Korsgaard:
> >>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
> 
> Hi,
> 
>  >> I offer to do something about both: Take over maintainership and get
>  >> atual stable releases out the door (if Erik and the other developers
>  >> agree).
> 
>  Thiago> I for one welcome our new maintainer overlord.
>  Thiago> Seriously, for what it's worth, you have my support.
> 
> Great, thanks.
> 
>  Thiago> AVR32 has been recently broken (again). I would much prefer
>  Thiago> that changes were reverted (termporarily or not) and have
>  Thiago> AVR32 in this "release" rather than deem it BROKEN.
> 
> What changes are those exactly?

The DEPRECATION of Binutils 2-17 is one thing.
That is fixed.

uClibc-0.9.29 is broken for everything it tried
AVR32, ARM, PowerPC.

Thiago, pls check which toolchain you are using.
All the old defconfigs will not work, and
you need to use the latest 4.2.2 with uClibc-0.9.30.



>  Thiago> Maybe we could get a buildbot going. Then we can let many of the
>  Thiago> developers/uses here contribute cpu cycle to build tests.
> 
> Yes, I have been pondering that as well. I have a buildbot running at
> work for the platforms we're using with good results, but it's a
> question about coming up with varying enough configs to get good test
> coverage.
> 
>  Thiago> The problem with qemu is that it will only cover some
>  Thiago> platforms that it supports, and unfortunally for me, it
>  Thiago> doesn't support AVR32 :(
> 
> Sure, if you have access to suitable hw, then that's better than qemu,
> but if not, then qemu is nice for the platforms it support.
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
