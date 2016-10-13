From: daggs <daggs@gmx.com>
Date: Thu, 13 Oct 2016 19:37:52 +0200
Subject: [Buildroot] minimal config for new xorg ddx driver testing
In-Reply-To: <87shs0n6ba.fsf@dell.be.48ers.dk>
References: <trinity-1074a4b4-83fd-4178-8f51-e9f3af810bd7-1476273824865@3capp-mailcom-bs01>,
 <87shs0n6ba.fsf@dell.be.48ers.dk>
Message-ID: <trinity-eefaf43a-2986-4224-bca9-05be1b31537e-1476380271995@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
>
> >>>>> "daggs" == daggs  <daggs@gmx.com> writes:
> 
>  > Greetings,
>  > I'm trying to test a new xorg ddx driver, problem is that I'm unable
>  > to start X properly. I never start by itself and I seem to always miss
>  > some cli params.
>  > is there any place were can I find a minimal config I can use that surely start an X based DE or something?
> 
> You can take a look at minnowboard_max-graphical_defconfig, as that one
> boots up into a X11 environment.
> 
thanks, it was really helpful.

Dagg.

> -- 
> Bye, Peter Korsgaard
> 
