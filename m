From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2011 09:09:29 +0200
Subject: [Buildroot] RFC: toolchain wrapper for external toolchains
In-Reply-To: <87r589j6c6.fsf@macbook.be.48ers.dk>
References: <1304433655-1629-1-git-send-email-jacmet@sunsite.dk>
	<BANLkTi=w7UaAyk4T2SHjv5h9Pm+gRQW+4g@mail.gmail.com>
	<20110508190135.0b9df312@surf> <87r589j6c6.fsf@macbook.be.48ers.dk>
Message-ID: <20110509090929.1060775e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 08 May 2011 22:16:41 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> Moreover, it has been committed only two days after the
>  Thomas> proposal, a duration which is very short for the other
>  Thomas> contributors to take the time to test the patches and give
>  Thomas> their opinion. This is also very short compared to the amount
>  Thomas> of time many other contributions have been waiting for being
>  Thomas> merged. For example, have a look at the patch set I
>  Thomas> contributed on April, 2nd
>  Thomas> (http://lists.busybox.net/pipermail/buildroot/2011-April/042309.html),
>  Thomas> which is also something that has been discussed during the
>  Thomas> FOSDEM meeting.
> 
> Yes. The config option rename is naturally massively intrusive, so I
> didn't want to rush to apply it (E.G. see the recent discussion about
> differing between what the toolchain has for ext toolchains and what
> we want to enable - E.G. ipv6 support)

Yes, I indeed understand that this patch set is intrusive :-)

>  Thomas> In the future, would it be possible to leave more time
>  Thomas> between post and commit, for such major infrastructure
>  Thomas> changes ?
> 
> Sure.

Thanks a lot. I strongly appreciate that it is possible to have this
kind of open discussion on the development process without entering any
sort of aggression or fight.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
