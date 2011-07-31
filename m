From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 31 Jul 2011 10:19:27 +0200
Subject: [Buildroot] [PATCH 1/2] orc: new package
In-Reply-To: <87k4b7uzey.fsf@macbook.be.48ers.dk>
References: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
 <1310628760-4172-2-git-send-email-s.neumann@raumfeld.com>
 <87k4b7uzey.fsf@macbook.be.48ers.dk>
Message-ID: <1312100368.687.4.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2011-07-24 at 23:44 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> Orc - the Oil Runtime Compiler - is the successor of liboil.
>  Sven> There's a runtime library that is installed in staging and target
>  Sven> and there's a host version that can be built if orcc, the ORC
>  Sven> compiler is needed at build time.
> 
> So presumably we should remove liboil? The only thing using it is
> swfdec, which afaik is long dead upstream.

Agreed.

> Should usr/bin/orcc get removed if !BR2_HAVE_DEVFILES or is it needed
> for anything?

Yes, that makes sense. There's also /usr/bin/orc-bugreport which should
probably be removed as well.

> I've committed with those changes (except for orcc, please advice) -
> Thanks.

I won't find time to do the proposed changes before next week as I am
currently on vacation.


Sven
