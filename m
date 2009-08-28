From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 28 Aug 2009 14:37:23 +0200
Subject: [Buildroot] [git commit master] u-boot: mark old 2008.10
 version as deprecated
In-Reply-To: <87y6p4dtam.fsf@macbook.be.48ers.dk>
References: <20090827124024.6B23277691@busybox.osuosl.org>
	<d6cda7730908271838qc80efdfj259e9bf1609f396e@mail.gmail.com>
	<87y6p4dtam.fsf@macbook.be.48ers.dk>
Message-ID: <20090828143723.6fb83311@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Aug 2009 14:20:01 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
> 
> Hi,
> 
>  Thiago>    Someone should test if newer u-boot works properly before
>  Thiago> doing that. This was the last known version to work with AVR32,
>  Thiago> and if I remember it correctly, the problem wasn't platform
>  Thiago> specific but something to do with the flash drivers or
>  Thiago> something. Sorry, can't be more specific, I have a very short
>  Thiago> memory.
> 
> I don't have any avr32 hw, so I cannot do it - What about you?
> 
> Notice that we're carrying an avr32 patch for 2009.01, so I guess it
> works for someone.
> 

Yes, all boards not using the common CFI driver will work, as they
provide their own flash driver. There is currently a discussion ongoing
on the u-boot mailing list regarding this topic. No conclusion yet, but
if a fix pops in for 2009.08 I'll let this list know. The it'll be safe
to use 2009.08 for all AVR32 boards (and probably all other archs as
well).

-- 
Best regards,
Hans-Christian Egtvedt
